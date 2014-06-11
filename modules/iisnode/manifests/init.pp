
class iisnode($version = '0.2.11') {

  require iis::install
  require nodejs

  $pkg = "iisnode-${version}-x64"

  package { $pkg :
    ensure    => installed,
    name      => 'iisnode for iis 7.x (x64) full',
    source    => "${shared_drive}\\iis\\nodejs\\${pkg}.msi",
  }
}
