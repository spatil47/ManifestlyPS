Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $WorkflowID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/checklists/$WorkflowID"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).checklist