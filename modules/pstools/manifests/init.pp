
class pstools {

  file { 'pstools':
    ensure  => directory,
    path    => 'C:\Program Files\PSTools',
    source  => 'puppet:///puppetfs/pstools',
    recurse => true,
    mode    => '0755'
  }

  windows_env { 'PATH=C:\Program Files\PSTools':
    ensure => present,
  }

  exec {'pstools-accept-eula':
    command   => 'reg.exe ADD HKCU\Software\Sysinternals\PSexec /v EulaAccepted /t REG_DWORD /d 1 /f',
    logoutput => true,
    unless    => 'reg.exe QUERY HKCU\Software\Sysinternals\PSexec /v EulaAccepted /t REG_DWORD /f 1'
  }
}
