Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
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
        [string] $RecordsPerPage,
    [Parameter()]
        [string] $Page
)

$Query = @{
    api_key      = $APIKey
    checklist_id = $ChecklistID
    external_id  = $ExternalID
    title        = $Title
    status       = $Status
    per_page     = $RecordsPerPage
    page         = $Page
}

$Request = @{
    Uri = "$Server/api/v1/runs/"
    Body = $query
    Method = "Get"
}

(Invoke-RestMethod @Request).runs