function Get-PythonExecutable {
    if ((python -Version 2>$null | Select-Object -ExpandProperty Version) -match "Python 3") {
        return "python"
    } else {
        return "python3"
    }
}

function Get-VersionNumber {
    return (Get-Content -Path "../version.txt" -Raw).Trim()
}

function Test-RequiredTools {
    $missing = @()
    if (-not (Get-Command 7z -ErrorAction SilentlyContinue)) { $missing += "7z (7-Zip)" }
    if (-not (Get-Command python -ErrorAction SilentlyContinue)) { $missing += "python" }
    $reshack = "C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe"
    if (-not (Test-Path $reshack)) { $missing += "Resource Hacker ($reshack)" }
    if ($missing.Count -gt 0) {
        throw "Missing required tools: $($missing -join ', ')"
    }
}

function Initialize-BuildEnvironment {
    Remove-Item -Path "temp/" -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path "dist" -Force | Out-Null
}

function Invoke-Compilation {
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
    & powershell -File ./compile-2.ps1 `
        -ResourceVersion $ResourceVersion `
        -FullVersion $FullVersion `
        -BuildVersion $BuildVersion `
        -ExecutableName $ExecutableName `
        -CompilePath $CompilePath `
        -SupplyTranslationReadme $SupplyTranslationReadme `
        -PythonExecutable $PythonExecutable `
        -ReshackExecutable $ReshackExecutable
}

Export-ModuleMember -Function Get-PythonExecutable, Get-VersionNumber, Test-RequiredTools, Initialize-BuildEnvironment, Invoke-Compilation
