
class nodejs::install ($version = '0.10.26') {

  $pkg = "node-v${version}-x64"

  case $::osfamily {

  windows: {

    package { $pkg:
      ensure    => installed,
      name      => 'Node.js',
      source    => "${shared_drive}\\nodejs\\${osfamily}\\${version}\\${pkg}.msi",
    }

    windows_env { 'PATH=C:\Program Files\nodejs':
      ensure => present,
    }

    windows_env { 'PATH=C:\Users\builduser\AppData\Roaming\npm':
      ensure => present,
    }
  }

  redhat : {
    #assuming  you are using RHEL 6.x and the EPEL repository
    package {'nodejs':
      ensure => present,
    }

    package {'npm':
      ensure =>  present,
    }
  }
}
}
