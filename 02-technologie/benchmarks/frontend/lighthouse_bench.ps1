# Bench frontend via Lighthouse (Windows / PowerShell 7+).
# Mesure les Core Web Vitals d'une ou plusieurs URLs (N exécutions, moyenne).
# Idéal pour comparer une page Next.js (SSR/SSG, build de prod) à une SPA React équivalente.
#
# Prérequis : Node.js installé. Lighthouse est appelé via npx (pas d'install globale requise).
# Le frontend doit tourner en mode PRODUCTION (npm run build && npm start), pas en dev.
#
# Usage :
#   ./lighthouse_bench.ps1 -Url "http://localhost:3000/deputes" -Runs 5
#   ./lighthouse_bench.ps1 -Url "http://localhost:3000/deputes" -Label "Next.js SSR"

param(
    [Parameter(Mandatory = $true)][string]$Url,
    [int]$Runs = 5,
    [string]$Label = "Next.js"
)

$ErrorActionPreference = "Stop"
$metrics = @("first-contentful-paint", "largest-contentful-paint",
    "speed-index", "total-blocking-time", "cumulative-layout-shift",
    "interactive", "server-response-time")  # server-response-time ≈ TTFB

$acc = @{}
foreach ($m in $metrics) { $acc[$m] = @() }
$scores = @()

for ($i = 1; $i -le $Runs; $i++) {
    Write-Host "[$Label] run $i/$Runs ..." -ForegroundColor Cyan
    $tmp = New-TemporaryFile
    npx --yes lighthouse $Url `
        --only-categories=performance `
        --output=json --output-path="$($tmp.FullName)" `
        --chrome-flags="--headless --no-sandbox" --quiet | Out-Null

    $json = Get-Content $tmp.FullName -Raw | ConvertFrom-Json
    $scores += [double]$json.categories.performance.score * 100
    foreach ($m in $metrics) {
        $val = $json.audits.$m.numericValue
        if ($null -ne $val) { $acc[$m] += [double]$val }
    }
    Remove-Item $tmp.FullName -Force -ErrorAction SilentlyContinue
}

function Avg($a) { if ($a.Count) { ($a | Measure-Object -Average).Average } else { [double]::NaN } }

Write-Host "`n===== Résultats moyens — $Label ($Runs runs) =====" -ForegroundColor Green
Write-Host ("Score performance  : {0:N0}/100" -f (Avg $scores))
Write-Host ("TTFB (server-resp) : {0:N0} ms" -f (Avg $acc["server-response-time"]))
Write-Host ("FCP                : {0:N0} ms" -f (Avg $acc["first-contentful-paint"]))
Write-Host ("LCP                : {0:N0} ms" -f (Avg $acc["largest-contentful-paint"]))
Write-Host ("Speed Index        : {0:N0} ms" -f (Avg $acc["speed-index"]))
Write-Host ("TBT                : {0:N0} ms" -f (Avg $acc["total-blocking-time"]))
Write-Host ("Time to Interactive: {0:N0} ms" -f (Avg $acc["interactive"]))
Write-Host ("CLS                : {0:N3}" -f (Avg $acc["cumulative-layout-shift"]))
Write-Host "`nReporte ces chiffres dans 07-tech-stack-comparison.md (section Performances mesurées)." -ForegroundColor DarkGray
