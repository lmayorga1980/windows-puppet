
class newrelic::monitor ($version = '3.1.17.0', $license = '') {

  $repo = 'newrelic-repo'
  $pkg  = "newrelicmonitor-x64_${version}"

  case $::operatingsystem {

  redhat : {

    exec { $repo:
      path      => '/usr/bin:/bin',
      command   => 'rpm -Uvh http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm',
      logoutput => true,
      onlyif    => 'test `yum repolist newrelic | grep "relic" -c` -eq 0'
    }

    package { 'newrelic-sysmond':
      ensure  => latest,
      require => Exec[$repo]
    }

    exec { 'newrelic-configure':
      command   => "/usr/sbin/nrsysmond-config --set license_key=${license}",
      logoutput => true,
      require   => Package['newrelic-sysmond'],
      unless    => "/bin/grep ${license} /etc/newrelic/nrsysmond.cfg"
    }

    exec { $pkg:
      command   => '/etc/init.d/newrelic-sysmond start',
      logoutput => true,
      require   => Exec['newrelic-configure'],
      onlyif    => '/etc/init.d/newrelic-sysmond status | grep "newrelic-sysmond is stopped"'
    }
  }

  windows : {

    package { $pkg:
      ensure          => installed,
      name            => 'New Relic Server Monitor',
      source          => "${shared_drive}\\newrelic\\${pkg}.msi",
      install_options => {'NR_LICENSE_KEY' => $license },
    }

    service { $pkg:
      ensure  => 'running',
      name    => 'nrsvrmon',
      enable  => true,
      require => Package[$pkg]
    }
  }

  default : {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }
}
}
