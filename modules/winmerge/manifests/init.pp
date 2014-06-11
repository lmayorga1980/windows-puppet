
class winmerge ($version = '2.14.0') {

  $pkg = "winmerge-${version}"

  package { $pkg :
    ensure           => installed,
    name             => "WinMerge ${version}",
    source           => "${shared_drive}\\winmerge\\${pkg}.exe",
    install_options  => [ '/VERYSILENT' ],
  }
}
