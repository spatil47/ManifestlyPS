<#
.SYNOPSIS
    List all Manifestly workflows for a department.

.DESCRIPTION
    This script uses the Manifestly API to list all workflows for a department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflows to be retrieved.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        One object per workflow, containing the user's account ID, workflow description, expected duration, units of expected duration, workflow ID, and workflow title.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/workflows-collection/list-all-workflows
#>

function Get-ManifestlyWorkflows {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey
    )

    $Query = @{
        api_key = $APIKey
    }

    $Request = @{
        Uri    = "$Server/api/v1/checklists/"
        Body   = $query
        Method = "Get"
    }

    (Invoke-RestMethod @Request).checklists
}