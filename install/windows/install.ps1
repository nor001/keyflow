# keyflow Windows workstation bootstrap
# Run from PowerShell at repository root:
#   .\install\windows\install.ps1
# Optional:
#   .\install\windows\install.ps1 -CoreOnly

[CmdletBinding()]
param(
    [switch]$CoreOnly
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Read-PackageFile {
    param([string]$Path)
    if (-not (Test-Path $Path)) { return @() }
    return Get-Content $Path | Where-Object { $_ -and -not $_.TrimStart().StartsWith("#") }
}

function Install-PackageId {
    param([string]$Id)
    Write-Host "Installing $Id"
    winget install --id $Id --source winget --accept-source-agreements --accept-package-agreements
}

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "winget was not found. Install Microsoft App Installer, then rerun this script."
}

$core = Read-PackageFile (Join-Path $ScriptDir "packages-core.txt")
$optional = Read-PackageFile (Join-Path $ScriptDir "packages-optional.txt")

foreach ($id in $core) {
    try { Install-PackageId $id } catch { Write-Warning "Skipped $id: $($_.Exception.Message)" }
}

if (-not $CoreOnly) {
    foreach ($id in $optional) {
        try { Install-PackageId $id } catch { Write-Warning "Optional skipped $id: $($_.Exception.Message)" }
    }
}

Write-Host "Manual follow-up: open install/windows/manual.md"
Write-Host "Comet fallback: https://www.perplexity.ai/comet"
Write-Host "SAP GUI/Logon remains manual/company-managed."
