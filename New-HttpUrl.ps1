Param(
    [Parameter(mandatory=$true)]
        [string] $Server,
    [Parameter(mandatory=$true)]
        [hashtable] $QueryParameters
)

$QueryString = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
 
$QueryParameters.GetEnumerator() | ForEach-Object {
    $QueryString.Add($_.Name, $_.Value)
}
 
$Url = [System.UriBuilder] $Server
$Url.Query = $QueryString.ToString()
 
return $Url.Uri.OriginalString