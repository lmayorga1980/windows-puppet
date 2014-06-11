
class octopus::tentacle($version = '2.3.6.1385', $thumbprint = '', $apikey = '', $url = 'octopus.server.org', $environment = '' ){

  $pkg = "octopus.tentacle.${version}-x64"

  file { $pkg :
    ensure => present,
    path   => "C:\\Temp\\${pkg}.msi",
    source => "puppet:///puppetfs/octopus/${pkg}.msi",
    mode   => '0755'
  } ->

  file { "${pkg}-config":
    ensure  => present,
    path    => 'C:\Temp\config.bat'
    content => template('octopus/config.erb'),
  } ->

  package { $pkg :
  	ensure          => installed,
  	name            => 'Octopus Deploy Tentacle',
  	source          => "C:\\Temp\\${pkg}.msi",
    install_options => [ 'INSTALLLOCATION=C:\OctopusTentacle' ],
  } -> 

  exec { $pkg :
    command => 'C:\Temp\config.bat',
    logoutput => true,
  }
}
