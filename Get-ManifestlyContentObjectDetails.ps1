Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $WorkflowID,
    [Parameter(mandatory=$true)]
        [string] $WorkflowStepID,
    [Parameter(mandatory=$true)]
        [string] $ContentObjectID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/checklists/$WorkflowID/steps/$WorkflowStepID/content_objects/$ContentObjectID"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).content_object