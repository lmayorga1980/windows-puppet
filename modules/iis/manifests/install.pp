
class iis::install{

  case $::kernelrelease {

  "6.3.9600": {

    each($iis::features) |$feature| {

      exec { "${feature}":
        command   => "Powershell.exe Install-WindowsFeature -Name ${feature} -IncludeAllSubFeature",
        logoutput => true,
        unless    => "Powershell.exe -Command \"((Get-WindowsFeature -Name ${feature}).Installed)\" | C:\\Windows\\System32\\findstr.exe True",
      }
    }
  }

  "6.1.7601": {

     each($iis::features) |$feature| {

      exec { "${feature}":
        command   => "Powershell.exe -Command \"Import-Module ServerManager; Add-WindowsFeature -Name ${feature}\" ",
        logoutput => true,
        unless    => "Powershell.exe -Command \"Import-Module ServerManager; (Get-WindowsFeature -Name ${feature}).Installed\" | C:\\Windows\\System32\\findstr.exe True",
      }
    }
  }

  default: { 
     fail("Module ${module_name} is not supported on ${::operatingsystem} ${::operatingsystemrelease}")
  }
 }
}
