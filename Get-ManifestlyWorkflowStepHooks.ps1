Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $WorkflowID,
    [Parameter(mandatory=$true)]
        [string] $WorkflowStepID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/checklists/$WorkflowID/steps/$WorkflowStepID/hooks"
    Body = $query
    Method = "Get"
}

(Invoke-RestMethod @Request).hooks