
class npmpackages {

  require nodejs

  #TODO:Pending variable abstraction to hiera for the following npm packages

  case $::osfamily {

  windows : {

  exec { 'dependo':
    command   => 'npm.cmd install -g dependo@0.1.1',
    logoutput => true,
    path      => 'C:\Program Files\nodejs',
    unless    => 'npm.cmd -g ls dependo@0.1.1 | c:\windows\system32\findstr.exe dependo@0.1.1'
  }

  exec { 'plato' :
    command   => 'npm.cmd install -g plato@0.6.2',
    logoutput => true,
    path      => 'C:\Program Files\nodejs',
    unless    => 'npm.cmd -g ls plato@0.6.2 | c:\windows\system32\findstr.exe plato@0.6.2'
  }

  exec { 'bower' :
    command   => 'npm.cmd install -g bower@1.2.7',
    logoutput => true,
    path      => 'C:\Program Files\nodejs',
    unless    => 'npm.cmd -g ls bower@1.2.7 | c:\windows\system32\findstr.exe bower@1.2.7'
  }

  exec { 'protractor' :
    command   => 'npm.cmd install -g protractor@0.15.0',
    logoutput => true,
    path      => 'C:\Program Files\nodejs',
    unless    => 'npm.cmd -g ls protractor@0.15.0 | c:\windows\system32\findstr.exe protractor@0.15.0'
  }

  exec { 'jasmine' :
    command   => 'npm.cmd install -g jasmine-node@1.13.1',
    logoutput => true,
    path      => 'C:\Program Files\nodejs',
    unless    => 'npm.cmd -g ls jasmine-node@1.13.1 | c:\windows\system32\findstr.exe jasmine-node@1.13.1',
  }

  exec { 'gulp' :
    command   => 'npm.cmd install -g gulp@3.6.0',
    logoutput => true,
    path      => 'C:\Program Files\nodejs',
    unless    => 'npm.cmd -g ls gulp@3.6.0 | c:\windows\system32\findstr.exe gulp@3.6.0',
  }
  }

  redhat : {

  exec { 'dependo':
    command   => 'npm install -g dependo@0.1.1',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls dependo@0.1.1 | /bin/grep dependo@0.1.1'
  }

  exec { 'plato' :
    command   => 'npm install -g plato@0.6.2',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls plato@0.6.2 | /bin/grep plato@0.6.2'
  }

  exec { 'bower' :
    command   => 'npm install -g bower@1.2.7',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls bower@1.2.7 | /bin/grep bower@1.2.7'
  }

  exec { 'protractor' :
    command   => 'npm install -g protractor@0.15.0',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls protractor@0.15.0 | /bin/grep protractor@0.15.0'
  }

  exec { 'jasmine' :
    command   => 'npm install -g jasmine-node@1.13.1',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls jasmine-node@1.13.1 | /bin/grep jasmine-node@1.13.1'
  }

  exec { 'gulp': 
    command => 'npm install -g gulp@3.6.0',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls gulp@3.6.0 | /bin/grep gulp@3.6.0'
  }

  # https://www.npmjs.org/package/pm2
  # only works on Linux/Mac
  exec { 'pm2' :
    command   => 'npm install -g pm2@0.8.0',
    logoutput => true,
    path      => '/usr/bin',
    unless    => 'npm -g ls pm2@0.8.0 | /bin/grep pm2@0.8.0'
  }
  }
}
}
