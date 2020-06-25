function New-ManifestlyWorkflowStep {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter(mandatory = $true)]
        [int] $WorkflowID,
        [Parameter()]
        [int] $Position,
        [Parameter()]
        [string] $Title,
        [Parameter()]
        [switch] $Header
    )

    $Query = @{
        api_key = $APIKey
    }

    $Body = @{
        header_step = $Header.IsPresent
        title       = $Title
        position    = $Position
    }

    
    $Request = @{
        Uri     = New-HttpUrl -QueryParameters $Query -Server "$Server/api/v1/checklists/$WorkflowID/steps"
        Headers = @{
            'Content-Type' = "application/json"
        }
        Body    = ($Body | ConvertTo-Json)
        Method  = "Post"
    }

    (Invoke-RestMethod @Request).step
}