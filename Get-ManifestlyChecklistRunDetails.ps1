<#
.SYNOPSIS
    Get details for a Manifestly checklist run.

.DESCRIPTION
    This script uses the Manifestly API to get details for a specified checklist run for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the checklist run details to be retrieved.

.PARAMETER APIKey
    The ID of the checklist run.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An object containing properties corresponding to the details of the checklist run.

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
        [string] $RunID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/runs/$RunID"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).run