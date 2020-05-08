Param(
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter()]
        [string] $ChecklistID,
    [Parameter()]
        [string] $ExternalID,
    [Parameter()]
        [string] $Title,
    [ValidateSet("started", "late", "completed")]
        [string] $Status,
    [Parameter()]
        [integer] $RecordsPerPage,
    [Parameter()]
        [string] $Page
)

$config = @{
    api_key      = $APIKey
    checklist_id = $ChecklistID
    external_id  = $ExternalID
    title        = $Title
    status       = $Status
    per_page     = $RecordsPerPage
    page         = $Page
}

((Invoke-WebRequest -Uri "https://api.manifest.ly/api/v1/runs/" -Body $config -Method Get).Content | ConvertFrom-Json).runs