
class mongodb::install{

  exec { 'mongodb':
        creates   => 'C:\mongodb\bin',
        command   => "7z.exe x $shared_drive\\mongodb\\${mongodb::pkg}.zip -o\"C:\\mongodb\" -y",
        logoutput => true,
        path      => 'C:\Program Files\7-Zip',
  }

  #FIXME: It seems that the mongodb installer does not support a different installation directory
  #package { $pkg :
  #  ensure          => installed,
  #  name            => "MongoDB ${version}",
  #  source          => "${shared_drive}\\mongodb\\${pkg}.msi",
  #  install_options => ['INSTALLDIR=C:\mongodb'],
  #}

}

