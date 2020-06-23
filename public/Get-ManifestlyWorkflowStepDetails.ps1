<#
.SYNOPSIS
    Get details of a Manifestly workflow step.

.DESCRIPTION
    This script uses the Manifestly API to get details of a specified workflow step for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflow step to be retrieved.

.PARAMETER WorkflowID
    The ID of the workflow.

.PARAMETER WorkflowID
    The ID of the workflow step.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An array of objects containing properties corresponding to the details of the workflow step.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/workflow-step/show-step
#>

function Get-ManifestlyWorkflowStepDetails {
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
        Uri    = "$Server/api/v1/checklists/$WorkflowID/steps/$WorkflowStepID"
        Body   = $Query
        Method = "Get"
    }

    (Invoke-RestMethod @Request).step
}