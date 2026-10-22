<#
.SYNOPSIS
    Generic build script for Domino English Translation.
.DESCRIPTION
    Builds a single target version (1.43, 1.44, 1.45_x86, or 1.45_x64) in dev or release mode.
.PARAMETER TargetVersion
    The target version to build.
.PARAMETER BuildType
    Build type: dev or release.
.PARAMETER BuildDate
    Build date string (defaults to current timestamp).
.PARAMETER ReshackExecutable
    Path to ResourceHacker.exe.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("1.43", "1.44", "1.45_x86", "1.45_x64")]
    [string]$TargetVersion,
    [ValidateSet("dev", "release")]
    [string]$BuildType = "dev",
    [string]$BuildDate = (Get-Date).ToString('yyyyMMddHHmmss'),
    [string]$ReshackExecutable = "C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Ensure we're running from the _script directory
$scriptDir = $PSScriptRoot
if ($scriptDir -and (Test-Path $scriptDir)) {
    Set-Location $scriptDir
}

# Load common module
Import-Module ./modules/common.psm1 -Force

# Validate required tools
Test-RequiredTools

# Load build config
$buildConfig = Import-PowerShellDataFile -Path ./build-config.psd1
$cfg = $buildConfig[$TargetVersion]

$PYTHON_EXECUTABLE = Get-PythonExecutable
$VERSION_NUM = Get-VersionNumber

Write-Host "Cleaning folders..."
Initialize-BuildEnvironment

$deployFiles = $cfg.DeployFiles
$resourceVersionPrefix = $cfg.ResourceVersionPrefix
$displayVersion = $cfg.DisplayName

$buildLabel = if ($BuildType -eq "dev") { "development version" } else { "release version" }
Write-Host "Building $displayVersion ($buildLabel)..."

# Preparation
Write-Host "Preparing..."
Write-Host "Removing temporary files..."
Remove-Item -Path "temp/" -Recurse -Force -ErrorAction SilentlyContinue

# Copy translations
foreach ($copy in $cfg.CopyCmd) {
    if ($copy -eq "copy-base") {
        Write-Host "Copying $displayVersion translations and other required files..."
    } else {
        $ver = $copy -replace "copy-", ""
        Write-Host "Copying $ver-specific translations..."
    }
    & powershell -File "./modules/$copy.ps1"
}

# Extract original files
Write-Host "Extracting $displayVersion original files..."
foreach ($deploy in $deployFiles) {
    $extractArgs = @("x", "..\_deploy\$deploy", "-otemp\_compile")
    if ($deployFiles.Count -gt 1) { $extractArgs += "-y" }
    & 7z @extractArgs
}

# Create compile config values
Write-Host "Creating compile config file..."
$fullVersion = if ($BuildType -eq "dev") {
    "$displayVersion-en.$VERSION_NUM-dev.$BuildDate"
} else {
    "$displayVersion-en.$VERSION_NUM"
}
$buildVersion = if ($BuildType -eq "dev") {
    "$VERSION_NUM-dev.$BuildDate"
} else {
    "$VERSION_NUM"
}
$executableName = if ($BuildType -eq "dev") {
    "Domino_Translated_$BuildDate.exe"
} else {
    "Domino.exe"
}

Write-Host "Preparation done!"

# Compilation
Write-Host "Compiling..."
Invoke-Compilation -ResourceVersion "$resourceVersionPrefix,$VERSION_NUM,0" `
    -FullVersion $fullVersion `
    -BuildVersion $buildVersion `
    -ExecutableName $executableName `
    -PythonExecutable $PYTHON_EXECUTABLE `
    -ReshackExecutable $ReshackExecutable `
    -SupplyTranslationReadme "true" `
    -CompilePath "temp/_compile"

Write-Host "Compilation done!"

# Packing
Write-Host "Copying compilation results..."
Copy-Item -Recurse -Path "temp/_compile" -Destination "dist" -Force
Write-Host "Building done!"
