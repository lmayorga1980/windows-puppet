
class fxcop ($version='10.0') {

  $pkg = "fxcop-${version}"

  package { $pkg:
    ensure           => installed,
    name             => "Microsoft FxCop ${version}",
    source           => "${shared_drive}\\fxcop\\${pkg}.exe",
    install_options  => [ '/q' ],
  }
}
