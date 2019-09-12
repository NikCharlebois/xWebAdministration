function Export-WebAdministrationConfiguration
{
    [CmdletBinding()]
    [OutputType([System.String])]

    $InformationPreference = "Continue"

    $DSCContent = "Configuration WebAdministrationConfiguration`r`n{`r`n"
    $DSCContent += "    Import-DSCResource -ModuleName xWebAdministration`r`n`r`n"
    $DSCContent += "    Node localhost`r`n"
    $DSCContent += "    {`r`n"

    $ResourcesPath = Join-Path -Path $PSScriptRoot `
                               -ChildPath "..\DSCResources\" `
                               -Resolve
    $AllResources = Get-ChildItem $ResourcesPath -Recurse | Where-Object {$_.Name -like 'MSFT_*.psm1'}

    foreach ($ResourceModule in $AllResources)
    {
        Import-Module $ResourceModule.FullName | Out-Null
        $DSCContent += Export-TargetResource
    }

    $DSCContent += "    }`r`n}`r`n"

    #region Prompt the user for a location to save the extract and generate the files
    if ($null -eq $Path -or "" -eq $Path)
    {
        $OutputDSCPath = Read-Host "Destination Path"
    }
    else
    {
        $OutputDSCPath = $Path
    }

    while ((Test-Path -Path $OutputDSCPath -PathType Container -ErrorAction SilentlyContinue) -eq $false)
    {
        try
        {
            Write-Information "Directory `"$OutputDSCPath`" doesn't exist; creating..."
            New-Item -Path $OutputDSCPath -ItemType Directory | Out-Null
            if ($?) {break}
        }
        catch
        {
            Write-Warning "$($_.Exception.Message)"
            Write-Warning "Could not create folder $OutputDSCPath!"
        }
        $OutputDSCPath = Read-Host "Please Provide Output Folder for DSC Configuration (Will be Created as Necessary)"
    }
    <## Ensures the path we specify ends with a Slash, in order to make sure the resulting file path is properly structured. #>
    if (!$OutputDSCPath.EndsWith("\") -and !$OutputDSCPath.EndsWith("/"))
    {
        $OutputDSCPath += "\"
    }
    $outputDSCFile = $OutputDSCPath + "HyperVConfiguration.ps1"
    $DSCContent | Out-File $outputDSCFile

    Invoke-Item -Path $OutputDSCPath
    #endregion
}
