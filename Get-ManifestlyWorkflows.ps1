Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey
)

$query = @{
    api_key = $APIKey
}

((Invoke-WebRequest -Uri "$Server/api/v1/checklists/" -Body $query -Method Get).Content | ConvertFrom-Json).checklists