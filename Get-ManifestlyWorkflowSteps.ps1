<#
.SYNOPSIS
    Get steps of a Manifestly workflow.

.DESCRIPTION
    This script uses the Manifestly API to get steps of a specified workflow for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflow steps to be retrieved.

.PARAMETER WorkflowID
    The ID of the workflow.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An array of objects containing properties corresponding to the steps of the workflow.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/workflow-steps-collection/list-all-workflow-steps
#>

#Requires -Version 4.0
Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $WorkflowID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/checklists/$WorkflowID/steps"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).steps