Param(
    [Parameter(mandatory=$true)]
        [string] $APIKey
)

$config = @{
    api_key = $APIKey
}

((Invoke-WebRequest -Uri "https://api.manifest.ly/api/v1/checklists/" -Body $config -Method Get).Content | ConvertFrom-Json).checklists