
class iis::winauth{

  file { 'WinAuth':
    ensure => present,
    path   => 'C:\Temp\WinAuth.ps1',
    source => 'puppet:///modules/iis/WinAuth.ps1',
    mode   => '0755'
  }

  exec { 'WinAuth':
    command   =>'Powershell.exe -ExecutionPolicy RemoteSigned -File C:\Temp\WinAuth.ps1',
    require   => File['WinAuth'],
    logoutput => true,
    unless    => 'cmd.exe /c "C:\Windows\System32\inetsrv\appcmd.exe list config /section:windowsAuthentication /text:enabled | C:\Windows\System32\findstr.exe true'
  }
}

