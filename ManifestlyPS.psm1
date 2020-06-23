#Requires -Version 2.0

if ($PSVersionTable.PSVersion.Major -ge 3) {
    $script:IgnoreError = 'Ignore'
} else {
    $script:IgnoreError = 'SilentlyContinue'
}

# Dot source public/private functions
$dotSourceParams = @{
    Filter      = '*.ps1'
    Recurse     = $true
    ErrorAction = 'Stop'
}
$public = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'public') @dotSourceParams )
$private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'private/*.ps1') @dotSourceParams)

foreach ($import in @($public + $private)) {
    try {
        . $import.FullName
    } catch {
        throw "Unable to dot source [$($import.FullName)]"
    }
}

export-modulemember -function $public.BaseName