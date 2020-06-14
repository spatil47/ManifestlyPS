<#
.SYNOPSIS
    Get comments on a Manifestly checklist run step.

.DESCRIPTION
    This script uses the Manifestly API to get comments on a specified checklist run step for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the checklist run step to be retrieved.

.PARAMETER RunID
    The ID of the checklist run.

.PARAMETER RunStepID
    The ID of the checklist run step.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An array of objects corresponding to the comments on the checklist run step.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/checklist-run/get-checklist-run-details
#>

#Requires -Version 4.0
Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $RunID,
    [Parameter(mandatory=$true)]
        [string] $RunStepID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/runs/$RunID/run_steps/$RunStepID/comments"
    Body = $query
    Method = "Get"
}

(Invoke-RestMethod @Request).comments