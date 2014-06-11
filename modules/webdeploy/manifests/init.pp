
class webdeploy ($version = '3.0') {

  $pkg = "webdeploy-${version}"

  package { $pkg :
    ensure           => installed,
    name             => "Microsoft Web Deploy ${version}",
    source           => "${shared_drive}\\webdeploy\\${pkg}.msi",
    install_options  => [ { 'ADDLOCAL' => 'ALL' } ],
  }

  service { 'MsDepSvc':
    ensure  => 'running',
    enable  => true,
    require => Package[$pkg],
  }

  windows_env { 'PATH=C:\Program Files (x86)\IIS\Microsoft Web Deploy V3':
    ensure => present,
  }
}
