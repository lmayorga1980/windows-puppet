
class newrelic::agent ($version = '2.12.146.0', $license = '') {

  $pkg = "newrelicagent-x64_${version}"

  case $::operatingsystem {

  windows : {

    package { $pkg:
      ensure          => installed,
      name            => 'New Relic .NET Agent (64-bit)',
      source          => "${shared_drive}\\newrelic\\${pkg}.msi",
      install_options => [ { 'INSTALLLEVEL' => '50' }, {'NR_LICENSE_KEY' => $license }],
    }

   # service {'W3SVC':
   #   ensure    => 'running',
   #   subscribe => Package[$pkg]
   # }
  }

  default : {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }
}
}
