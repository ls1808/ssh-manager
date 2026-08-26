param(
    [ValidatePattern('^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$')]
    [string]$Version = '1.0.0',
    [ValidateSet('main', 'beta')]
    [string]$Channel = 'main',
    [string]$Output = 'release\SSH-Manager.exe'
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $projectRoot 'src'
$objectRoot = Join-Path $projectRoot 'obj'
$outputPath = Join-Path $projectRoot $Output
$compiler = Join-Path $env:WINDIR 'Microsoft.NET\Framework64\v4.0.30319\csc.exe'

New-Item -ItemType Directory -Path $objectRoot -Force | Out-Null
New-Item -ItemType Directory -Path (Split-Path -Parent $outputPath) -Force | Out-Null

$numericVersion = ($Version -split '-')[0] + '.0'
$versionSource = Join-Path $objectRoot 'VersionInfo.cs'
@"
using System.Reflection;
[assembly: AssemblyVersion("$numericVersion")]
[assembly: AssemblyFileVersion("$numericVersion")]
[assembly: AssemblyInformationalVersion("$Version")]
"@ | Set-Content -LiteralPath $versionSource -Encoding UTF8

$arguments = @(
    '/nologo', '/target:winexe', '/optimize+',
    "/win32icon:$sourceRoot\ssh-manager-logo.ico",
    "/resource:$sourceRoot\ssh-manager-logo.png,SSHManagerLogo.png",
    "/out:$outputPath",
    "/reference:$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationFramework.dll",
    "/reference:$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationCore.dll",
    "/reference:$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\WPF\WindowsBase.dll",
    "/reference:$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\System.Xaml.dll",
    "/reference:$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\System.Web.Extensions.dll",
    "/reference:$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\System.Security.dll"
)
if ($Channel -eq 'beta') { $arguments += '/define:BETA' }
$arguments += (Join-Path $sourceRoot 'SSHManager.cs')
$arguments += $versionSource

& $compiler $arguments
if ($LASTEXITCODE -ne 0) { throw "C# compilation failed with exit code $LASTEXITCODE." }

Write-Host "Built $Channel version $Version -> $outputPath"

