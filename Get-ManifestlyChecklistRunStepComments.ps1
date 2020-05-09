Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $RunID,
    [Parameter(mandatory=$true)]
        [string] $RunStepID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/runs/$RunID/run_steps/$RunStepID/comments"
    Body = $query
    Method = "Get"
}

(Invoke-RestMethod @Request).comments