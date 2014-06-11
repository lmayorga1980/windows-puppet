
class powershell{

  $pkg = 'powershell-settings'

  exec { "${pkg}-64bit":
    command   => 'Powershell.exe Set-ExecutionPolicy RemoteSigned',
    logoutput => true,
    unless    => 'Powershell.exe Get-ExecutionPolicy | C:\Windows\System32\findstr.exe RemoteSigned'
  }

  exec { "${pkg}-64bit-Remoting":
    command   => 'Powershell.exe Enable-PSRemoting -Force -Verbose',
    logoutput => true,
    unless    => 'Powershell.exe Get-Service WinRm | C:\Windows\System32\findstr.exe Running'
  }

  exec { "${pkg}-64bit-MaxMemoryPerShell":
    command   => 'Powershell.exe Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB 2048 -Verbose',
    logoutput => true,
    unless    => 'Powershell.exe Get-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB | C:\Windows\System32\findstr.exe 2048'
  }

  exec { "${pkg}-32bit":
    command   => 'Powershell.exe Set-ExecutionPolicy RemoteSigned',
    logoutput => true,
    path      => 'C:\Windows\System32\WindowsPowerShell\v1.0',
    unless    => 'Powershell.exe Get-ExecutionPolicy | C:\Windows\System32\findstr.exe RemoteSigned',
  }

}
