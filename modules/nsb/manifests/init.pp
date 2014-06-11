
class nsb ($version = '4.0.2') {

  $pkg = "Particular.NServiceBus-${version}"

  package { $pkg:
    ensure           => installed,
    name             => "Particular Software NServiceBus v${version}",
    source           => "${shared_drive}\\nsb\\${pkg}.exe",
    install_options  => [ '/q', '/l', 'C:\Temp\nsbinstall.log' ]
  }
}