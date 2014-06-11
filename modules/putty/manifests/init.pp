
class putty ($version = '0.63') {

  require sevenzip

  $pkg = "putty-${version}"

  file { $pkg:
    ensure => present,
    path   => "C:\\Temp\\${pkg}.zip",
    source => "puppet:///puppetfs/putty/${pkg}.zip",
    mode   => '0755'
  } ->

  exec { $pkg:
    creates   => 'C:\Program Files (x86)\Putty',
    command   => "7z.exe x C:\\Temp\\${pkg}.zip -o\"C:\\Program Files (x86)\\Putty\" -y",
    logoutput => true,
    path      => 'C:\Program Files\7-Zip',
  }
}