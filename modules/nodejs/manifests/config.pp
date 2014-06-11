
class nodejs::config {

  case $::osfamily {

  windows : {

    exec { 'set-node-registry' :
      command   => 'npm.cmd config set registry="http://registry.npmjs.org/"',
      logoutput => true,
      path      => 'C:\Program Files\nodejs',
      onlyif    => 'npm.cmd config get registry | c:\windows\system32\findstr.exe https://registry.npmjs.org',
    }
  }

  redhat :
  {
    file { 'nodejs-env' :
      ensure => present,
      path   => '/etc/profile.d/nodejs-env.sh',
      source => 'puppet:///modules/nodejs/nodejs-env.sh',
      mode   => '0775'
    }
  }
  }
}
