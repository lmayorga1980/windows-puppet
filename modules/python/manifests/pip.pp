
class python::pip {

  require python

  file { 'pip':
    ensure => present,
    path   => '/tmp/get-pip.py',
    source => 'puppet:///puppetfs/python/get-pip.py',
    mode   => '0755'
  } ->

  exec { 'pip':
    command   => 'python get-pip.py',
    logoutput => true,
    unless    => 'pip --version',
    path      => '/usr/bin'
  }
}
