
class webpicmd{

  file { 'WebPiCmd':
    ensure  => present,
    path    => 'C:\Temp\WebPiCmd.exe',
    source  => 'puppet:///modules/webpicmd/WebPiCmd.exe',
    mode    => '0755',
  }

  file { 'WebPiCmdDll':
    ensure  => present,
    path    => 'C:\Temp\Microsoft.Web.PlatformInstaller.dll',
    source  => 'puppet:///modules/webpicmd/Microsoft.Web.PlatformInstaller.dll',
    mode    => '0755',
  }
}
