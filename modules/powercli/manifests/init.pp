
class powercli($version = '5.5.0-1671586') {

  $pkg = "VMware-PowerCLI-${version}"

  #FIXME: worth it to move this to a package resource type?
  #package { $pkg:
  #  ensure          => installed,
  #  name            => 'PowerCLI',
  #  source          => "C:\\Temp\\${pkg}.exe",
  #  install_options => ['/s','/w','/q','/V"/qr ADDLOCAL=ALL"','/L*v "C:\Temp\${pkg}.log"'],
  #  require         => File[$pkg],
  #}

  exec { $pkg :
    creates   => 'C:\Program Files (x86)\VMware\Infrastructure\vSphere PowerCLI',
    command   => "${shared_drive}\\powercli\\${pkg}.exe /s /w /v/qn /V\"/qr ADDLOCAL=ALL\"",
    cwd       => 'C:\Temp',
    logoutput => true,
    timeout   => 900,
  }
}
