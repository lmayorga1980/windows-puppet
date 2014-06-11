
class packer($version = '0.6.0') {

  file {'packer-cmd':
    ensure  => directory,
    path    => 'C:\Program Files\Packer',
    source  => "puppet:///puppetfs/packer/${version}/${osfamily}",
    mode    => '0755',
    recurse => true,
  }

  windows_env { 'PATH=C:\Program Files\Packer':
    ensure => present,
  }
}
