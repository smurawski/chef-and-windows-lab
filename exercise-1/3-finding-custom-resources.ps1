## PowerShellGet Makes It Easy

Find-Module 

## Look for specific modules
Find-Module xWebAdministration

## Find every version of the module in the repository
Find-Module xWebAdministration -AllVersions

## Find a specific version of the module
Find-Module xWebAdministration -RequiredVersion 1.9.0.0

## Interested in Module Versioning?
## The PowerShell Team has an RFC about that.
## Weigh in - https://github.com/PowerShell/PowerShell-RFC/blob/master/1-Draft/RFC0004-PowerShell-Module-Versioning.md

## Looking for modules with DSC resources?

Find-Module -includes DscResource

## Want to find the resources available?

Find-DscResource