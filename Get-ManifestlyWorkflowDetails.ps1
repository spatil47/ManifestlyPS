<#
.SYNOPSIS
    List details of a Manifestly workflow.

.DESCRIPTION
    This script uses the Manifestly API to list the details of a workflow.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflow.

.PARAMETER WorkflowID
    The ID of the workflow.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        User's account ID, workflow's business days, channel, description, expected duration, units of expected duration, external ID, whether steps are hidden from external users, workflow ID, steps, tag list, and workflow title.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/workflows-collection/list-all-workflows
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
    Uri = "$Server/api/v1/checklists/$WorkflowID"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).checklist