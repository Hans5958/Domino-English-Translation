<#
.SYNOPSIS
    Compile step for Domino English Translation.
.DESCRIPTION
    Prepares resource files and compiles using Resource Hacker.
.PARAMETER ResourceVersion
    Resource version string (e.g., "1,43,5,0").
.PARAMETER FullVersion
    Full version string.
.PARAMETER BuildVersion
    Build version string.
.PARAMETER ExecutableName
    Output executable name.
.PARAMETER CompilePath
    Path to compile directory.
.PARAMETER SupplyTranslationReadme
    Whether to supply translation readme.
.PARAMETER PythonExecutable
    Python executable name.
.PARAMETER ReshackExecutable
    Path to ResourceHacker.exe.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceVersion,
    [Parameter(Mandatory=$true)]
    [string]$FullVersion,
    [Parameter(Mandatory=$true)]
    [string]$BuildVersion,
    [string]$ExecutableName = "Domino.exe",
    [string]$CompilePath = "temp/_compile",
    [string]$SupplyTranslationReadme = "true",
    [Parameter(Mandatory=$true)]
    [string]$PythonExecutable,
    [string]$ReshackExecutable = "C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Ensure we're running from the _script directory
$scriptDir = $PSScriptRoot
if ($scriptDir -and (Test-Path $scriptDir)) {
    Set-Location $scriptDir
}

Write-Host "Compile process started."

$RESOURCE_VERSION = $ResourceVersion
$FULL_VERSION = $FullVersion
$BUILD_VERSION = $BuildVersion
$EXECUTABLE_NAME = $ExecutableName
$COMPILE_PATH = $CompilePath
$SUPPLY_TRANSLATION_README = $SupplyTranslationReadme
$PYTHON_EXECUTABLE = $PythonExecutable
$RESHACK_EXECUTABLE = $ReshackExecutable

Set-Location $COMPILE_PATH

Write-Host "Preparing resource files..." 

# Create resource files by concatenating source files
Get-ChildItem ..\Dialog\* | Get-Content | Set-Content -Path Dialog.rc
Get-ChildItem ..\Menu\* | Get-Content | Set-Content -Path Menu.rc
Get-ChildItem ..\StringTable\* | Get-Content | Set-Content -Path StringTable.rc
Get-ChildItem ..\VersionInfo\* | Get-Content | Set-Content -Path VersionInfo.rc

New-Item -ItemType Directory -Path 240 -Force | Out-Null
Copy-Item -Path ..\240\_240.rc -Destination 240

# Process .bin.txt files
Get-ChildItem ..\240\*.bin.txt | ForEach-Object {
    $f = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    & $PythonExecutable ..\parsecombo.py pack $_.FullName "240/$f"
}

# Update VersionInfo.rc lines
$versionLine = "FILEVERSION $RESOURCE_VERSION"
$content = Get-Content VersionInfo.rc
$content[1] = $versionLine
Set-Content -Path VersionInfo.rc -Value $content

$productVersionLine = "PRODUCTVERSION $RESOURCE_VERSION"
$content = Get-Content VersionInfo.rc
$content[2] = $productVersionLine
Set-Content -Path VersionInfo.rc -Value $content

$fileVersionLine = "`tVALUE `"FileVersion`", `"$FULL_VERSION`""
$content = Get-Content VersionInfo.rc
$content[11] = $fileVersionLine
Set-Content -Path VersionInfo.rc -Value $content

$productVersionLine2 = "`tVALUE `"ProductVersion`", `"$FULL_VERSION`""
$content = Get-Content VersionInfo.rc
$content[16] = $productVersionLine2
Set-Content -Path VersionInfo.rc -Value $content

Write-Host "Compiling using Resource Hacker..." 

# Create tmp.txt
$tmpTxt = @"
[FILENAMES]
Exe=    Domino.exe
SaveAs= $ExecutableName
Log=    CON
[COMMANDS]
-delete  MENU,,
-delete  DIALOG,,
-delete  STRINGTABLE,,
-delete  VERSIONINFO,,
-delete  240,,
-add     Menu.res, MENU,,
-add     Dialog.res, DIALOG,,
-add     StringTable.res, STRINGTABLE,,
-add     VersionInfo.res, VERSIONINFO,,
-add     240.res, 240,,
"@
$tmpTxt | Set-Content -Path tmp.txt

# Compile with Resource Hacker
& $ReshackExecutable -open Dialog.rc -save Dialog.res -action compile -log CON
& $ReshackExecutable -open Menu.rc -save Menu.res -action compile -log CON
& $ReshackExecutable -open StringTable.rc -save StringTable.res -action compile -log CON
& $ReshackExecutable -open VersionInfo.rc -save VersionInfo.res -action compile -log CON

Set-Location 240
& $ReshackExecutable -open _240.rc -save ..\240.res -action compile -log CON
Set-Location ..

& $ReshackExecutable -script tmp.txt

# Create executable
New-Item -ItemType File -Path $ExecutableName -Force | Out-Null

Write-Host "Compilation done!" 

Write-Host "Copying other translated files..." 
if (Test-Path Manual) {
    Remove-Item -Path Manual -Recurse -Force
    Copy-Item -Recurse -Path ..\Manual -Destination . -Force
}
if (Test-Path Module) {
    Copy-Item -Recurse -Path ..\Module\* -Destination .\Module -Force
}
if (Test-Path System) {
    Copy-Item -Recurse -Path ..\System\* -Destination .\System -Force
}
Copy-Item -Recurse -Path ..\Other\* -Destination . -Force

Write-Host "Removing temporary files..." 
Remove-Item -Path "*.rc" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "*.res" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "tmp.*" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "240" -Recurse -Force -ErrorAction SilentlyContinue

if ($SupplyTranslationReadme -eq "true") {
    Write-Host "Creating translation readme..." 
    Copy-Item -Path ..\readme-translation.txt -Destination .
    $content = Get-Content readme-translation.txt
    $content[1] = "Build $BuildVersion ($FullVersion)"
    Set-Content -Path readme-translation.txt -Value $content
}

Write-Host "Compile process completed."
