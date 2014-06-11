Import-Module ServerManager
Import-Module Webadministration

Set-WebConfigurationProperty -filter /system.webServer/security/authentication/windowsAuthentication -name enabled -value true
 
