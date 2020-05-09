Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter()]
        [string] $WorkflowID,
    [Parameter()]
        [string] $RunExternalID,
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
    checklist_id = $WorkflowID
    external_id  = $RunExternalID
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