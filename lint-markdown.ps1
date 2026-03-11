# Script de linter Markdown pour Windows PowerShell
Write-Host "--- Execution du linter Markdown ---" -ForegroundColor Green

$ErrorsFound = $false

# Markdown Lint
Write-Host "Markdown Lint..." -ForegroundColor Cyan
try {
    markdownlint . --config .markdownlint.json
    if ($LASTEXITCODE -ne 0) { $ErrorsFound = $true }
} catch {
    Write-Host "Error: markdownlint-cli non trouve." -ForegroundColor Red
    Write-Host "Pour installer: npm install -g markdownlint-cli" -ForegroundColor Yellow
    $ErrorsFound = $true
}

# Resume
if ($ErrorsFound) {
    Write-Host "Termine avec des erreurs." -ForegroundColor Red
    exit 1
} else {
    Write-Host "Succes : Le linter Markdown est OK !" -ForegroundColor Green
    exit 0
}