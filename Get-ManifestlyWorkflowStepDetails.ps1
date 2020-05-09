Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $ChecklistID,
    [Parameter(mandatory=$true)]
        [string] $StepID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/checklists/$ChecklistID/steps/$StepID"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).step