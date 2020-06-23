<#
.SYNOPSIS
    Get steps of a Manifestly checklist run.

.DESCRIPTION
    This script uses the Manifestly API to get steps of a specified checklist run for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the checklist run details to be retrieved.

.PARAMETER RunID
    The ID of the checklist run.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An object containing properties corresponding to the steps of the checklist run.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/checklist-run-steps-collection/list-all-steps-for-a-checklist-run
#>

function Get-ManifestlyChecklistRunSteps {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter(mandatory = $true)]
        [string] $RunID
    )

    $Query = @{
        api_key = $APIKey
    }

    $Request = @{
        Uri    = "$Server/api/v1/runs/$RunID/run_steps"
        Body   = $query
        Method = "Get"
    }

    (Invoke-RestMethod @Request).run_steps
}