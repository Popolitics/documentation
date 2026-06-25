# Bench backend AUTOMATISÉ (Windows / PowerShell 7+).
# Lance FastAPI puis Django (via le venv), les charge avec wrk (Docker),
# sur les endpoints /json et /deputes, puis arrête tout. Une seule commande.
#
# Prérequis :
#   - Docker Desktop lancé
#   - venv créé :  python -m venv .venv ; .\.venv\Scripts\Activate.ps1 ; pip install -r requirements.txt
#
# Usage :  .\run.ps1                       (8 threads, 50 connexions, 12 s)
#          .\run.ps1 -Connections 200 -Duration 15

param(
    [int]$Threads = 8,
    [int]$Connections = 50,
    [int]$Duration = 12
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

# --- Python du venv (sinon python global) ---
$py = Join-Path $root ".venv/Scripts/python.exe"
if (-not (Test-Path $py)) {
    Write-Host "venv introuvable, utilisation du python global. (pense à : python -m venv .venv)" -ForegroundColor Yellow
    $py = "python"
}

# --- Docker dispo ? ---
try { docker version --format '{{.Server.Version}}' | Out-Null }
catch { Write-Host "ERREUR : Docker ne répond pas. Lance Docker Desktop d'abord." -ForegroundColor Red; exit 1 }

function Bench-Server($name, $module, $app, $port) {
    Write-Host "`n############ $name (port $port) ############" -ForegroundColor Cyan
    Push-Location $root
    $srv = Start-Process -FilePath $py `
        -ArgumentList "-m", "uvicorn", "${module}:${app}", "--host", "0.0.0.0", "--port", "$port", "--workers", "1", "--log-level", "error" `
        -PassThru -NoNewWindow
    Start-Sleep -Seconds 4
    try {
        foreach ($ep in @("json", "deputes")) {
            Write-Host "`n--- $name  /$ep  ($Threads threads, $Connections conns, ${Duration}s) ---" -ForegroundColor Yellow
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

Write-Host "`nReporte 'Requests/sec' + p50/p90/p99 dans 07-tech-stack-comparison.md (section 4.2)." -ForegroundColor Green
