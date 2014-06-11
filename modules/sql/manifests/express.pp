class sql::express($version = '2008R2',
                  $features = 'SQLENGINE,IS'){

  require netfx45

  $pkg = "sqlexpress-${version}"

  file { 'sql_config' :
    ensure  => present,
    path    => 'C:\Temp\setup.ini',
    content => template('sql/setupexpress.erb'),
    mode    => '0755'
  } ->

  package { $pkg:
    ensure          => installed,
    name            => "Microsoft SQL Server 2008 R2 Setup (English)",
    source          => "${shared_drive}\\sql\\express\\${pkg}.exe",
    install_options => [ '/ConfigurationFile=C:\Temp\setup.ini' ],
  }
}
