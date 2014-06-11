Import-Module ServerManager

$path = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent 

$rolesAndFeatures = Import-Clixml $path/WebServerRolesAndFeatures.xml

$rolesAndFeatures | Add-WindowsFeature 
 
