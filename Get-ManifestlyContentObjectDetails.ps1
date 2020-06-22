<#
.SYNOPSIS
    Get details of a Manifestly content object.

.DESCRIPTION
    This script uses the Manifestly API to retrieve details of a specified content object for a specified department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the workflow.

.PARAMETER WorkflowID
    The ID of the workflow of the content objects to be retrieved.

.PARAMETER WorkflowStepID
    The ID of the workflow step.

.PARAMETER ContentObjectID
    The ID of the content object to be retrieved.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        An object containing properties corresponding to the content object.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/workflow-steps-collection/show-content-object
#>

#Requires -Version 4.0
Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey,
    [Parameter(mandatory=$true)]
        [string] $WorkflowID,
    [Parameter(mandatory=$true)]
        [string] $WorkflowStepID,
    [Parameter(mandatory=$true)]
        [string] $ContentObjectID
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/checklists/$WorkflowID/steps/$WorkflowStepID/content_objects/$ContentObjectID"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).content_object