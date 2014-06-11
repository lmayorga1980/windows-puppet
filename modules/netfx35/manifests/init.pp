
class netfx35 {

  case $::kernelrelease {

    '6.1.7601': {
      exec { "netfx35":
        command   => 'Powershell.exe -Command "Import-Module ServerManager; Add-WindowsFeature -Name Net-Framework-Core" ',
        logoutput => true,
        unless    => 'Powershell.exe -Command "Import-Module ServerManager; (Get-WindowsFeature -Name Net-Framework-Core).Installed" | C:\\Windows\\System32\\findstr.exe True',
      }

      #reboot {'after netframework35':
      #  subscribe => Exec['netfx35']
      #}
    }

    '6.3.9600': {
      #notify { "This operating system already ships with Net Framework 3.5" :}
    }

    default: { 
      fail("Module ${module_name} is not supported on ${::operatingsystem} ${::operatingsystemrelease}")
    }
  }
}
