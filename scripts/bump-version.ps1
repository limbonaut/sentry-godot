Param(
    [Parameter(Mandatory = $true)][String]$prevVersion,
    [Parameter(Mandatory = $true)][String]$newVersion
)
Set-StrictMode -Version latest

$sconsFile = "$PSScriptRoot/../SConstruct"
$content = Get-Content $sconsFile
$content -replace 'VERSION = ".*"', ('VERSION = "' + $newVersion + '"') | Out-File $sconsFile

# Check that the version was updated.
if ("$content" -eq "$(Get-Content $sconsFile)")
{
    $versionInFile = [regex]::Match("$content", 'VERSION = "([^"]+)"').Groups[1].Value
    if ("$versionInFile" -ne "$newVersion")
    {
        Throw "Failed to update version in $sconsFile - the content didn't change. The version found in the file is '$versionInFile'."
    }
}