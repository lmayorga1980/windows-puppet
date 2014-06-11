filebucket { 'main':
  server => 'puppetmaster.localdomain',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

# Custom Definitions
define lineendings ($file) {
  exec { "convertlineendings_${file}":
    command => "sed -i $'s/\r$//' ${file}",
    path    => '/usr/bin:/bin',
  }
}

case $::operatingsystem {

  redhat,centos,ubuntu: { hiera_include('classes') }

  windows: {
    $shared_drive = #Include your UNC Shared Package Drive# \\your_server\shared\path
    File { source_permissions => ignore } #PE 3.2.3 and above
    Exec { path => [ 'C:\Windows\sysnative\WindowsPowerShell\v1.0','C:\Windows\System32\inetsrv','C:\Windows\sysnative','C:\Windows\Microsoft.NET\Framework\v4.0.30319','C:\Windows\System32\wbem', 'C:\Temp' ] }
    hiera_include('classes')
  }
  default : { fail('Unrecognized operating system for Puppet') }
}
