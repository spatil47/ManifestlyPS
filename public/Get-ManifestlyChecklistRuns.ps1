<#
.SYNOPSIS
    Get Manifestly checklist runs.

.DESCRIPTION
    This script uses the Manifestly API to retrieve specified checklist runs for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the checklist runs to be retrieved.

.PARAMETER WorkflowID
    The ID of the workflow of the checklist runs to be retrieved.

.PARAMETER RunID
    The ID of he checklist runs to be retrieved.

.PARAMETER RunExternalID
    The external ID of the checklist runs to be retrieved.

.PARAMETER Title
    The title of the checklist runs to be retrieved.

.PARAMETER Status
    The status of the checklist runs to be retrieved.

.PARAMETER RecordsPerPage
    The number of records to return per request.

.PARAMETER Page
    The page to be returned.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An array of objects, each containing properties corresponding to the checklist run.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/checklist-runs-collection/list-all-checklist-runs
#>

function Get-ManifestlyChecklistRuns {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter()]
        [string] $WorkflowID,
        [Parameter()]
        [string] $RunExternalID,
        [Parameter()]
        [string] $Title,
        [ValidateSet("started", "late", "completed")]
        [string] $Status,
        [Parameter()]
        [string] $RecordsPerPage = 30,
        [Parameter()]
        [string] $Page
    )

    $Query = @{
        api_key      = $APIKey
        checklist_id = $WorkflowID
        external_id  = $RunExternalID
        title        = $Title
        status       = $Status
        per_page     = $RecordsPerPage
        page         = $Page
    }

    $Request = @{
        Uri    = "$Server/api/v1/runs/"
        Body   = $query
        Method = "Get"
    }

    (Invoke-RestMethod @Request).runs
}