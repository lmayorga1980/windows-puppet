
class blend ($version = '2.0.20525') {

  require 'silverlight40'
  
  $pkg = "blend-${version}"

  package { $pkg :
    ensure   => installed,
    name     => 'Microsoft Expression Blend SDK for Silverlight 4',
    source   => "${shared_drive}\\blend\\${pkg}.msi",
  }
}
