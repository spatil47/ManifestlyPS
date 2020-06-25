function New-ManifestlyContentObject {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter(mandatory = $true)]
        [int] $WorkflowID,
        [Parameter()]
        [int] $WorkflowStepID,
        [Parameter(mandatory = $true)]
        [string] $Content,
        [Parameter()]
        [string] $Position,
        [Parameter()]
        [string] $Caption,
        [Parameter(mandatory = $true)][ValidateSet("file","video","text","image")]
        [string] $ContentType
    )

    $Query = @{
        api_key = $APIKey
    }

    $Body = @{
        content_type = $ContentType
        content      = $Content
        caption      = $Caption
        position     = $Position
    }

    
    $Request = @{
        Uri     = New-HttpUrl -QueryParameters $Query -Server "$Server/api/v1/checklists/$WorkflowID/steps/$WorkflowStepID/content_objects"
        Headers = @{
            'Content-Type' = "application/json"
        }
        Body    = ($Body | ConvertTo-Json)
        Method  = "Post"
    }

    (Invoke-RestMethod @Request).content_object
}