<#
.SYNOPSIS
    Unified build-all script for Domino English Translation.
.DESCRIPTION
    Builds all target versions in release, nightly, or artifact mode.
.PARAMETER BuildMode
    Build mode: release, nightly, or artifact.
.PARAMETER BuildDate
    Build date string (defaults to current timestamp).
#>
[CmdletBinding()]
param(
    [ValidateSet("release", "nightly", "artifact")]
    [string]$BuildMode = "release",
    [string]$BuildDate = (Get-Date).ToString('yyyyMMddHHmmss')
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Ensure we're running from the _script directory
$scriptDir = Split-Path $PSScriptRoot -Parent
if ($scriptDir -and (Test-Path $scriptDir)) {
    Set-Location $scriptDir
}

# Load common module
Import-Module ./modules/common.psm1 -Force

# Load build config
$buildConfig = Import-PowerShellDataFile -Path ./build-config.psd1

# Validate required tools
Test-RequiredTools

$PYTHON_EXECUTABLE = Get-PythonExecutable
$VERSION_NUM = Get-VersionNumber

Write-Host "Cleaning folders..."
Initialize-BuildEnvironment

$targetOrder = @("1.43", "1.44", "1.45_x86", "1.45_x64")

foreach ($target in $targetOrder) {
    $cfg = $buildConfig[$target]
    $displayName = $cfg.DisplayName
    Write-Host "Building $displayName ($BuildMode version)..."
    
    Write-Host "::group::Prepare for compilation"
    Write-Host "Preparing..."
    
    Write-Host "Removing temporary files..."
    Remove-Item -Path "temp/" -Recurse -Force -ErrorAction SilentlyContinue
    
    # Copy translations
    foreach ($copy in $cfg.CopyCmd) {
        if ($copy -eq "copy-base") {
            Write-Host "Copying translations and other required files..."
        } else {
            $ver = $copy -replace "copy-", ""
            Write-Host "Copying $ver-specific translations..."
        }
        & powershell -File "./modules/$copy.ps1"
    }
    
    # Extract original files
    Write-Host "Extracting $displayName original files..."
    foreach ($deploy in $cfg.DeployFiles) {
        $extractArgs = @("x", "..\_deploy\$deploy", "-otemp\_compile")
        if ($cfg.DeployFiles.Count -gt 1) { $extractArgs += "-y" }
        & 7z @extractArgs
    }
    
    # Create compile config values
    Write-Host "Creating compile config file..."
    $resourceVersionPrefix = $cfg.ResourceVersionPrefix
    
    $fullVersion = switch ($BuildMode) {
        "release" { "$displayName-en.$VERSION_NUM" }
        "nightly" { "$displayName-en.$VERSION_NUM-nightly.$BuildDate" }
        "artifact" { "$displayName-en.$VERSION_NUM-artifact.$BuildDate" }
    }
    $buildVersion = switch ($BuildMode) {
        "release" { "$VERSION_NUM" }
        "nightly" { "$VERSION_NUM-nightly.$BuildDate" }
        "artifact" { "$VERSION_NUM-artifact.$BuildDate" }
    }
    $executableName = "Domino.exe"
    
    Write-Host "Preparation done!"
    Write-Host "::endgroup::"
    
    # Compilation
    Write-Host "::group::Compilation"
    Write-Host "Compiling..."
    Invoke-Compilation -ResourceVersion "$resourceVersionPrefix,$VERSION_NUM,0" `
        -FullVersion $fullVersion `
        -BuildVersion $buildVersion `
        -ExecutableName $executableName `
        -PythonExecutable $PYTHON_EXECUTABLE `
        -CompilePath "temp/_compile" `
        -SupplyTranslationReadme "true"
    Write-Host "Compilation done!"
    Write-Host "::endgroup::"
    
    # Packing
    Write-Host "::group::Pack distributable"
    Write-Host "Packing distributable..."
    
    $artifactName = $cfg.ArtifactName
    
    if ($BuildMode -eq "artifact") {
        Copy-Item -Recurse -Path "temp\_compile" -Destination "dist\$($artifactName)_Translated" -Force
    } else {
        Set-Location temp\_compile
        & 7z a "..\..\dist\$($artifactName)_Translated.zip" *
        Set-Location ..\..
        Move-Item -Path "temp\_compile\Domino.exe" -Destination "dist\$($artifactName)_Translated.exe" -Force
    }
    
    Write-Host "Packing done!"
    Write-Host "::endgroup::"
    
    Write-Host "Building done!"
    Write-Host ""
}
