function New-ManifestlyChecklistRun {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter(mandatory = $true)]
        [int] $ChecklistID,
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
        checklist_id = $ChecklistID
        title        = $Title
        late_at      = $Deadline
        users        = $AssignedUsers
        origin       = $Origin
    }

    $Request = @{
        Uri    = (.\New-HttpUrl.ps1 -QueryParameters $Query -Server "$Server/api/v1/runs/")
        Body   = ($body | ConvertTo-Json)
        Method = "Post"
    }

    Invoke-RestMethod @Request
}