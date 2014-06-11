
class wget ($version = '1.11.4-1') {

  $pkg = "wget-${version}"

  package { $pkg :
    ensure           => installed,
    name             => "GnuWin32: Wget-${version}",
    source           => "${shared_drive}\\wget\\${pkg}.exe",
    install_options  => [ '/SP', '/VERYSILENT', '/NORESTART' ],
  }

  windows_env { 'PATH=C:\Program Files (x86)\GnuWin32\bin':
    ensure => present,
  }
}
