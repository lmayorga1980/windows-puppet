
class mongodb::configure{

  file { 'D:\mongodata' :
    ensure => directory,
  } ->

  file { 'D:\mongologs' :
    ensure => directory,
  } ->

  file { 'D:\mongocfg' :
    ensure => directory,
  } ->

  file { 'D:\mongocfg\mongodb.conf' :
    ensure  => present,
    content => template('mongodb/mongodb.conf.erb'),
  } ->

  exec { 'configure-mongo' :
    command   => 'mongod -f D:\mongocfg\mongodb.conf --install --serviceName mdb261 --serviceDisplayName "MongoDB Server Instance" --serviceDescription "MongoDB Server Instance"',
    path      => ['C:\mongodb\bin', 'C:\Windows\sysnative'],
    logoutput => true,
    unless    => 'cmd.exe /c "sc query mdb261"',
  } -> 

  service { 'mdb261' :
    ensure => running,
    enable => true,
  }
}
