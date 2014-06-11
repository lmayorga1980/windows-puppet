
class urlrewriter ($version = '2.0') {

  require iis::install, iis::aspnet, iis::winauth

  $pkg     = "rewrite_${version}_rtw_x64"

  package { $pkg :
    ensure   => installed,
    name     => 'IIS URL Rewrite Module 2',
    source   => "${shared_drive}\\urlrewriter\\${pkg}.msi",
  }
}
