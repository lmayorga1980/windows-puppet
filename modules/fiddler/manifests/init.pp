
class fiddler ($version='4.4.5.3') {

  $pkg = "fiddler-${version}"

  file { $pkg:
    ensure => present,
    path   => "C:\\Temp\\${pkg}.exe",
    source => "puppet:///puppetfs/fiddler/${pkg}.exe",
    mode   => '0755'
  }

  package { $pkg:
    ensure           => installed,
    name             => 'Fiddler',
    source           => "C:\\Temp\\${pkg}.exe",
    install_options  => [ '/S' ],
    require          => File[$pkg]
  }
}
