
class iis::configure{

  service { 'W3SVC':
    ensure => running,
    enable => true,
  } ->

  service { 'WMSVC':
    ensure => running,
    enable => true,
  }

  registry_value { 'HKLM\SOFTWARE\Microsoft\WebManagement\Server\EnableRemoteManagement':
    ensure  => present,
    type    => dword,
    data    => '1',
    notify  => Service['WMSVC'],
  }
}
