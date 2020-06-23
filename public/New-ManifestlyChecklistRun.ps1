function New-ManifestlyChecklistRun {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter(mandatory = $true)]
        [int] $WorkflowID,
        [Parameter()]
        [string] $Title,
        [Parameter()]
        [string] $Deadline,
        [Parameter()]
        [int[]] $AssignedUsers,
        [Parameter()]
        [string] $Origin = "ManifestlyPS"
    )

    $Query = @{
        api_key = $APIKey
    }

    $Body = @{
        checklist_id = $WorkflowID
        title        = $Title
        late_at      = $Deadline
        users        = $AssignedUsers
        origin       = $Origin
    }

    
    $Request = @{
        Uri    = New-HttpUrl -QueryParameters $Query -Server "$Server/api/v1/runs/"
        Headers = @{
            'Content-Type' = "application/json"
        }
        Body   = ($Body | ConvertTo-Json)
        Method = "Post"
    }

    Invoke-RestMethod @Request
}