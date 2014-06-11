
class firefox ($version='24.0') {

  $pkg = "firefox-${version}"

  package { $pkg :
    ensure           => installed,
    name             => "Mozilla Firefox ${version} (x86 en-US)",
    source           => "${shared_drive}\\firefox\\${pkg}.exe",
    install_options  => [ '-ms' ],
  }
}
