<#
.SYNOPSIS
    Get Manifestly content objects.

.DESCRIPTION
    This script uses the Manifestly API to retrieve contents for a specified workflow step for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflow.

.PARAMETER WorkflowID
    The ID of the workflow of the content objects to be retrieved.

.PARAMETER WorkflowStepID
    The ID of the workflow step.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An array of objects, each containing properties corresponding to the content objects.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/content-objects-collection/list-content-objects
#>

function Get-ManifestlyContentObjects {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string] $Server = "https://api.manifest.ly",
        [Parameter(mandatory = $true)]
        [string] $APIKey,
        [Parameter(mandatory = $true)]
        [string] $WorkflowID,
        [Parameter(mandatory = $true)]
        [string] $WorkflowStepID
    )

    $Query = @{
        api_key = $APIKey
    }

    $Request = @{
        Uri    = "$Server/api/v1/checklists/$WorkflowID/steps/$WorkflowStepID/content_objects"
        Body   = $Query
        Method = "Get"
    }

    (Invoke-RestMethod @Request).content_objects
}