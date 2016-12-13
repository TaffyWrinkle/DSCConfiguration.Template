﻿configuration TemplateWithConfigData
{
    <#
        .DESCRIPTION
        DSC Coniguration that uses ConfigData file

        .EXAMPLE
        TemplateWithConfigData -outpath c:\dsc\

        .NOTES
        This configuration requires the corresponding configdata file
    #>

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration', @{ModuleName='xPSDesiredStateConfiguration';ModuleVersion='5.0.0.0'}
    
    Node $AllNodes.NodeName
    {
        # WindowsOptionalFeature is compatible with the Nano Server installation option
        File testfile
        {
            Ensure          = 'Present'
            DestinationPath = $Data.Path
            Contents        = $Data.Contents
        }
        xArchive testarchive
        {
            Ensure          = 'Present'
            Destination     = $Data.Destination
            Path            = $Data.Path
        }
    }
}

configuration TemplateBasic
{
    <#
        .DESCRIPTION
        Basic configuration template

        .EXAMPLE
        TemplateBasic -outpath c:\dsc\

        .NOTES
        This is the most basic configuration and does not take parameters or configdata
    #>

    Import-DscResource -module 'PSDesiredStateConfiguration'
    
    Node localhost
    {
        # WindowsOptionalFeature is compatible with the Nano Server installation option
        File testfile
        {
            Ensure          = 'Present'
            DestinationPath = 'c:\filetoo.txt'
            Contents        = 'this is some text too'
        }
    }
}
