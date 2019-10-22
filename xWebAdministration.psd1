@{
# Version number of this module.
moduleVersion = '2.7.0.0'

# ID used to uniquely identify this module
GUID = 'b3239f27-d7d3-4ae6-a5d2-d9a1c97d6ae4'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2019 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Module with DSC Resources for Web Administration'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Adds dependency to ReverseDSC
RequiredModules = @(@{ModuleName = "ReverseDSC"; RequiredVersion = "1.9.4.7"; })

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xWebAdministration/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xWebAdministration'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Changes to xWebAdministration
  * Opt-in to the following DSC Resource Common Meta Tests:
    * Common Tests - Relative Path Length
    * Common Tests - Validate Script Files
    * Common Tests - Validate Module Files
    * Common Tests - Validate Markdown Files
    * Common Tests - Validate Markdown Links
    * Common Tests - Custom Script Analyzer Rules
    * Common Tests - Flagged Script Analyzer Rules
    * Common Tests - Required Script Analyzer Rules
    * Common Tests - Validate Example Files
  * Add ConfigurationPath to xIisMimeTypeMapping examples since it is now a required field.

'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules     = @('Modules\ReverseDSCCollector.psm1')

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = 'Export-WebAdministrationConfiguraton'
}



















