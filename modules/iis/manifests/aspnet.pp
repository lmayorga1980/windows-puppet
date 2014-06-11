
class iis::aspnet{

  exec { 'Register ASP.NET on IIS':
    command   => 'aspnet_regiis.exe -i -enable',
    logoutput => true,
    unless    => 'cmd.exe /c "C:\Windows\System32\inetsrv\appcmd.exe list apppool /managedRuntimeVersion:v4.0 | C:\Windows\System32\findstr.exe v4.0"'
  }
}
