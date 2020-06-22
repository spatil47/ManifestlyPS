<#
.SYNOPSIS
    Get hooks of a Manifestly workflow.

.DESCRIPTION
    This script uses the Manifestly API to get hooks of a specified workflow for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflow to be retrieved.

.PARAMETER WorkflowID
    The ID of the workflow.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An array of objects containing properties corresponding to the hooks of the workflow.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/workflow-steps-hooks/list-hooks
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
    Uri = "$Server/api/v1/checklists/$WorkflowID/hooks"
    Body = $query
    Method = "Get"
}

(Invoke-RestMethod @Request).hooks