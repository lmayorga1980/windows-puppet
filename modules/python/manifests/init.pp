
class python($version = '2.6.6') {

  $pkg = "python-${version}"

  case $::operatingsystem {

    redhat : {
      package { 'python26':
        ensure => installed
      }

      package { 'python26-devel':
        ensure  => installed,
        require => Package['python26']
      }
    }

    windows : {

      package { $pkg:
        ensure   => installed,
        name     => "Python ${version}",
        source   => "${shared_drive}\\python\\${pkg}.msi",
      }
    }

    default : {

    }
  }
}
