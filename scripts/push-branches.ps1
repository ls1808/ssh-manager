$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

if (Test-Path -LiteralPath '.repo') {
    git --git-dir='.repo' --work-tree='.' push -u origin main beta
} else {
    git push -u origin main beta
}

if ($LASTEXITCODE -ne 0) {
    throw 'GitHub rejected the push. Confirm that this Windows account has an SSH key registered with GitHub.'
}

