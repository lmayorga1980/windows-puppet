
class mvc{

  require webpicmd

  $mvc = 'AspNetMVC1'

  package { $mvc:
    ensure   => installed,
    name     => 'Microsoft ASP.NET MVC 1.0',
    source   => "${shared_drive}\\mvc\\${mvc}.msi",
  } ->

  exec { 'mvc30':
    command   => 'WebPiCmd.exe /Install /Products:MVC3 /AcceptEula /Log:C:\Temp\MVC3Log.htm',
    logoutput => true,
    cwd       => 'C:\Temp',
    unless    => 'cmd.exe /c "WebPiCmd.exe /List /ListOption:Installed | findstr.exe MVC3"',
    timeout   => 900
  } ->

  exec { 'mvc40':
    creates   => 'C:\Program Files (x86)\Microsoft ASP.NET\ASP.NET MVC 4',
    command   => "${shared_drive}\\mvc\\AspNetMVC4Setup.exe /q",
    logoutput => true,
    timeout   => 900,
  }
}
