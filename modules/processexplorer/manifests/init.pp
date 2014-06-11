
class processexplorer ($version = '15.40') {

  require sevenzip

  $pkg = "processexplorer-${version}"

  file { $pkg:
    ensure => present,
    path   => "C:\\Temp\\${pkg}.zip",
    source => "puppet:///puppetfs/processexplorer/${pkg}.zip",
    mode   => '0755'
  } ->

  exec { $pkg:
    creates   => 'C:\Program Files (x86)\Process Explorer',
    command   => "7z.exe x C:\\Temp\\${pkg}.zip -o\"C:\\Program Files (x86)\\Process Explorer\" -y",
    logoutput => true,
    path      => 'C:\Program Files\7-Zip',
  }
}