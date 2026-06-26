<#
  bench.ps1 — Utilitaire unique pour lancer tous les benchmarks POPolitics.
  Windows / PowerShell 7+.

  USAGE :
    .\bench.ps1 setup        # installe les dépendances (venv Python + npm des 2 apps front)
    .\bench.ps1 backend      # bench back : FastAPI vs Django (wrk via Docker)
    .\bench.ps1 frontend     # bench front : Core Web Vitals (Lighthouse) + test SEO
    .\bench.ps1 seo          # uniquement le test SEO / crawlabilité (HTML brut)
    .\bench.ps1 all          # tout : setup + backend + frontend

  OPTIONS back :
    .\bench.ps1 backend -Connections 200 -Duration 15

  PRÉREQUIS :
    - Docker Desktop lancé          (pour le back, via wrk)
    - Node.js + Chrome installés     (pour le front, via Lighthouse)
#>

param(
    [Parameter(Position = 0)]
    [ValidateSet("setup", "backend", "frontend", "seo", "all", "help")]
    [string]$Task = "help",

    [int]$Threads = 8,
    [int]$Connections = 50,
    [int]$Duration = 12,
    [int]$Runs = 5
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$backend = Join-Path $root "backend"
$next = Join-Path $root "frontend-next"
$spa = Join-Path $root "frontend-spa"
$lh = Join-Path $root "frontend/lighthouse_bench.ps1"
$py = Join-Path $backend ".venv/Scripts/python.exe"

function Section($txt) { Write-Host "`n========== $txt ==========" -ForegroundColor Magenta }
function Info($txt) { Write-Host $txt -ForegroundColor Cyan }
function Warn($txt) { Write-Host $txt -ForegroundColor Yellow }

function Test-Docker {
    try { docker version --format '{{.Server.Version}}' | Out-Null; return $true }
    catch { Warn "Docker ne répond pas. Lance Docker Desktop avant le bench back."; return $false }
}

# ---------------------------------------------------------------- SETUP
function Invoke-Setup {
    Section "SETUP — dépendances"

    Info "Backend : venv Python + pip install"
    Push-Location $backend
    if (-not (Test-Path $py)) { python -m venv .venv }
    & $py -m pip install --quiet --upgrade pip
    & $py -m pip install --quiet -r requirements.txt
    Pop-Location

    Info "Front Next.js : npm install"
    Push-Location $next ; if (-not (Test-Path "node_modules")) { npm install --silent } ; Pop-Location

    Info "Front SPA : npm install"
    Push-Location $spa ; if (-not (Test-Path "node_modules")) { npm install --silent } ; Pop-Location

    Write-Host "Setup terminé." -ForegroundColor Green
}

# ---------------------------------------------------------------- BACKEND
function Invoke-Backend {
    Section "BACKEND — FastAPI vs Django (wrk)"
    if (-not (Test-Docker)) { return }
    if (-not (Test-Path $py)) { Warn "venv absent — lance d'abord : .\bench.ps1 setup"; return }

    function Bench-Server($name, $module, $app, $port) {
        Write-Host "`n--- $name (port $port) ---" -ForegroundColor Cyan
        Push-Location $backend
        $srv = Start-Process -FilePath $py `
            -ArgumentList "-m", "uvicorn", "${module}:${app}", "--host", "0.0.0.0", "--port", "$port", "--workers", "1", "--log-level", "error" `
            -PassThru -NoNewWindow
        Start-Sleep -Seconds 4
        try {
            foreach ($ep in @("json", "deputes")) {
                Write-Host "`n  > $name /$ep ($Threads t, $Connections c, ${Duration}s)" -ForegroundColor Yellow
                docker run --rm williamyeh/wrk -t$Threads -c$Connections -d"${Duration}s" --latency "http://host.docker.internal:$port/$ep"
            }
        }
        finally {
            Stop-Process -Id $srv.Id -Force -ErrorAction SilentlyContinue
            Pop-Location
        }
    }

    Bench-Server "FastAPI" "fastapi_app" "app" 8001
    Bench-Server "Django"  "django_app"  "application" 8002
    Write-Host "`n→ Reporter 'Requests/sec' + p50/p90/p99 dans 07-tech-stack-comparison.md (§4.2)." -ForegroundColor Green
}

# ---------- Helper : démarre un serveur front et renvoie le process ----------
function Start-FrontServer($dir, $binArgs) {
    Push-Location $dir
    if (-not (Test-Path "node_modules")) { npm install --silent }
    npm run build | Out-Null
    $srv = Start-Process -FilePath "node" -ArgumentList $binArgs -PassThru -NoNewWindow
    Pop-Location
    Start-Sleep -Seconds 6
    return $srv
}

# ---------------------------------------------------------------- FRONTEND
function Invoke-Frontend {
    Section "FRONTEND — Core Web Vitals (Lighthouse)"

    # Next.js
    Info "Build + serveur Next.js (port 3000)"
    $n = Start-FrontServer $next @("node_modules/next/dist/bin/next", "start", "-p", "3000")
    try { & $lh -Url "http://localhost:3000" -Runs $Runs -Label "Next.js" }
    finally { Stop-Process -Id $n.Id -Force -ErrorAction SilentlyContinue }

    # SPA
    Info "Build + serveur SPA React (port 4173)"
    $s = Start-FrontServer $spa @("node_modules/vite/bin/vite.js", "preview", "--port", "4173")
    try { & $lh -Url "http://localhost:4173" -Runs $Runs -Label "SPA React" }
    finally { Stop-Process -Id $s.Id -Force -ErrorAction SilentlyContinue }

    # Puis le test SEO dans la foulée
    Invoke-Seo
    Write-Host "`n→ Reporter les Core Web Vitals + le ratio SEO dans 07-tech-stack-comparison.md (§4.3)." -ForegroundColor Green
}

# ---------------------------------------------------------------- SEO
function Invoke-Seo {
    Section "FRONTEND — SEO / crawlabilité (HTML brut)"

    $n = Start-FrontServer $next @("node_modules/next/dist/bin/next", "start", "-p", "3000")
    $s = Start-FrontServer $spa @("node_modules/vite/bin/vite.js", "preview", "--port", "4173")
    try {
        $nextHtml = (Invoke-WebRequest "http://localhost:3000" -UseBasicParsing).Content
        $spaHtml = (Invoke-WebRequest "http://localhost:4173" -UseBasicParsing).Content
        $nc = ([regex]::Matches($nextHtml, "Député")).Count
        $sc = ([regex]::Matches($spaHtml, "Député")).Count
        Write-Host ("`nNext.js   : {0,6} octets HTML | 'Député' x{1}  (contenu pré-rendu)" -f $nextHtml.Length, $nc) -ForegroundColor Green
        Write-Host ("SPA React : {0,6} octets HTML | 'Député' x{1}  (page vide pour un crawler)" -f $spaHtml.Length, $sc) -ForegroundColor Green
    }
    finally {
        Stop-Process -Id $n.Id -Force -ErrorAction SilentlyContinue
        Stop-Process -Id $s.Id -Force -ErrorAction SilentlyContinue
    }
}

# ---------------------------------------------------------------- HELP
function Invoke-Help {
    Write-Host @"

bench.ps1 — Utilitaire unique pour lancer tous les benchmarks POPolitics.

USAGE :
  .\bench.ps1 setup        Installe les dépendances (venv Python + npm des 2 apps front)
  .\bench.ps1 backend      Bench back : FastAPI vs Django (wrk via Docker)
  .\bench.ps1 frontend     Bench front : Core Web Vitals (Lighthouse) + test SEO
  .\bench.ps1 seo          Uniquement le test SEO / crawlabilité (HTML brut)
  .\bench.ps1 all          Tout : setup + backend + frontend

OPTIONS back :
  .\bench.ps1 backend -Connections 200 -Duration 15
  .\bench.ps1 frontend -Runs 3

PRÉREQUIS :
  - Docker Desktop lancé        (back, via wrk)
  - Node.js + Chrome installés  (front, via Lighthouse)
"@ -ForegroundColor Cyan
}

switch ($Task) {
    "setup" { Invoke-Setup }
    "backend" { Invoke-Backend }
    "frontend" { Invoke-Frontend }
    "seo" { Invoke-Seo }
    "all" { Invoke-Setup; Invoke-Backend; Invoke-Frontend }
    default { Invoke-Help }
}
