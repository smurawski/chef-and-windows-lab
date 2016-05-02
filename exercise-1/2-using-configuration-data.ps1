## Hashtable to define the environmental data
$ConfigData=@{
    ## Node specific data
    AllNodes = @(

       ## All the WebServers have some shared information 
       @{
            NodeName           = '*'
            WebsiteName        = 'FourthCoffee'
            SourcePath         = 'C:\BakeryWebsite\'
            DestinationPath    = 'C:\inetpub\FourthCoffee'
            DefaultWebSitePath = 'C:\inetpub\wwwroot'
       },

       @{
            ## When using a pull server, your nodename is a GUID
            ## You can also use named configurations (new in PS 5)
            NodeName           = '701922e4-a37d-4c5b-857e-936c18ed9067'
            HostName           = 'WebServer1.fourthcoffee.com'
            ## You can override that shared data on a per-node basis
            DestinationPath    = 'C:\inetpub\sites\FourthCoffee'
            Role               = 'Web'
        },

       @{
            NodeName           = 'f9e6d8fc-01d1-49dd-9794-8bee46bf89a4'
            HostName           = 'WebServer2.fourthcoffee.com'
            Role               = 'Web'
        }
    );
} 

## Create our configuration command
Configuration Sample_Using_ConfigurationData
{
    # Import the module that defines custom resources
    Import-DscResource -Module xWebAdministration, PSDesiredStateConfiguration

    # Dynamically find the applicable nodes from configuration data
    Node $AllNodes.where{$_.Role -eq 'Web'}.NodeName
    {
        # Install the IIS role
        WindowsFeature IIS
        {
            Ensure          = 'Present'
            Name            = 'Web-Server'
        }

        # Install the ASP .NET 4.5 role
        WindowsFeature AspNet45
        {
            Ensure          = 'Present'
            Name            = 'Web-Asp-Net45'
        }

        # Stop an existing website (set up in Sample_xWebsite_Default)
        xWebsite DefaultSite 
        {
            Ensure          = 'Present'
            Name            = 'Default Web Site'
            State           = 'Stopped'
            PhysicalPath    = $Node.DefaultWebSitePath
            DependsOn       = '[WindowsFeature]IIS'
        }

        # Copy the website content
        File WebContent
        {
            Ensure          = 'Present'
            SourcePath      = $Node.SourcePath
            DestinationPath = $Node.DestinationPath
            Recurse         = $true
            Type            = 'Directory'
            DependsOn       = '[WindowsFeature]AspNet45'
        }       

        # Create a new website
        xWebsite BakeryWebSite 
        {
            Ensure          = 'Present'
            Name            = $Node.WebsiteName
            State           = 'Started'
            PhysicalPath    = $Node.DestinationPath
            DependsOn       = '[File]WebContent'
        }
    }
}

## Generate our configurations
Sample_Using_ConfigurationData -ConfigurationData $ConfigData

## Let's see what that generated
# dir ./Sample_Using_ConfigurationData | foreach { psedit $_.fullname }

## One configuration should have the default DestinationPath
dir ./Sample_Using_ConfigurationData | select-string 'inetpub\\\\FourthCoffee'

## And one will be overridden
dir ./Sample_Using_ConfigurationData | select-string 'sites\\\\FourthCoffee'
