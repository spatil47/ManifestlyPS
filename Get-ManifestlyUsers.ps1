<#
.SYNOPSIS
    List all Manifestly users in a department.

.DESCRIPTION
    This script uses the Manifestly API to list all users in a department.
    The department is specified by the API key.

.PARAMETER Server
    The server providing the Manifestly API.

.PARAMETER APIKey
    The Manifestly API key associated with the department of the users to be retrieved.

.INPUTS
    None.

.OUTPUTS
    System.Management.Automation.PSCustomObject
        One object per user, containing ID, membership ID, full name, role, display name, and username.

.LINK
    https://manifestlyapi.docs.apiary.io/#reference/0/users-collection/list-all-users
#>

#Requires -Version 4.0
Param(
    [Parameter()]
        [string] $Server = "https://api.manifest.ly",
    [Parameter(mandatory=$true)]
        [string] $APIKey
)

$Query = @{
    api_key = $APIKey
}

$Request = @{
    Uri = "$Server/api/v1/users"
    Body = $Query
    Method = "Get"
}

(Invoke-RestMethod @Request).users