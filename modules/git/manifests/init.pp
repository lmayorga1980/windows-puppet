
class git ($version = '1.9.2') {

  $pkg = "git-${version}"

  case $::osfamily {

  redhat,debian : {
    package { 'git':
        ensure => present
    }
  }

  windows : {

    package { $pkg :
      ensure           => installed,
      name             => "Git version ${version}-preview20140411",
      source           => "${shared_drive}\\git\\${pkg}.exe",
      install_options  => [ '/SP-', '/VERYSILENT', '/SUPPRESSMSGBOXES' ],
    } ->

    windows_env { 'PATH=C:\Program Files (x86)\Git\bin':
      ensure => present,
    }
  }

  default : {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }
}
}
