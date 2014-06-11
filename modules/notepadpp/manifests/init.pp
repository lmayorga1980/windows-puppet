
class notepadpp ($version = '6.5') {

  $pkg = "npp-${version}"

  package { $pkg:
    ensure           => installed,
    name             => 'Notepad++',
    source           => "${shared_drive}\\notepadpp\\${pkg}.exe",
    install_options  => [ '/S' ],
  }
}