
class chrome ($version = '32.0.1700.102') {

  $pkg = "chrome-${version}"

  package { $pkg :
    ensure   => installed,
    name     => 'Google Chrome',
    source   => "${shared_drive}\\chrome\\${pkg}.msi",
  }

  service { 'gupdate':
    ensure  => stopped,
    enable  => false,
    require => Package[$pkg]
  }

  service { 'gupdatem':
    ensure  => stopped,
    enable  => false,
    require => Package[$pkg]
  }

  registry_key { 'gupdate-regkey':
    ensure  => present,
    path    => 'HKLM\SOFTWARE\Policies\Google\Update',
    require => Service['gupdate']
  }

  registry_value { 'HKLM\SOFTWARE\Policies\Google\Update\UpdateDefault':
    ensure  => present,
    type    => dword,
    data    => '0',
    require => Registry_key['gupdate-regkey']
  }
}
