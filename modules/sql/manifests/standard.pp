
class sql::standard($version  = '2008R2',
                    $features = 'SQLENGINE,IS',
                    $pid = '') {

  require netfx45

  $pkg = "sqlstandard-${version}"

  case $version {
    '2008R2':
    {
      $pkgName = 'Microsoft SQL Server 2008 Setup (English)'
    }
    '2012R2':
    {
      $pkgName = 'Microsoft SQL Server 2012 Setup (English)'
    }
    default:
    {
      $pkgName = 'Microsoft SQL Server 2008 Setup (English)'
    }
  }

  file { 'sql_config' :
    ensure  => present,
    path    => 'C:\Temp\setup.ini',
    content => template("sql/setup${version}.erb"),
    mode    => '0755'
  } ->

  exec { $pkg :
    creates => 'C:\Program Files\Microsoft SQL Server\100\Tools\Binn',
    command => "${shared_drive}\\sql\\standard\\${version}\\setup.exe /ConfigurationFile=C:\\Temp\\setup.ini",
    timeout => 1200
  }
}
