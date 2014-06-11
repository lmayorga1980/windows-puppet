
class cygwin ($version = '1.7.25') {

  $pkg = "cygwin-${version}"

  file { $pkg:
    ensure  => present,
    path    => "C:\\Temp\\${pkg}",
    source  => "puppet:///puppetfs/cygwin/${pkg}",
    mode    => '0775',
    recurse => true
  }

  exec { $pkg:
    creates   => "C:\\${pkg}",
    command   => "C:\\Temp\\${pkg}\\setup-x86_64.exe -q --local-install --root C:\\${pkg} -l C:\\Temp\\${pkg}\\release",
    logoutput => true,
    timeout   => 900,
    require   => File[$pkg]
  }
}
