
class hg ($version = '2.2.2') {

  $pkg = "mercurial-${version}"

  case $::osfamily {

    redhat : {

    file { $pkg :
        ensure => present,
        path   => '/tmp/install-mercurial.sh',
        mode   => '0755',
        source => 'puppet:///modules/hg/install-mercurial.sh'
    }

    exec { $pkg :
        creates   => '/usr/local/bin/hg',
        command   => '/bin/bash /tmp/install-mercurial.sh',
        logoutput => true,
        require   => File[$pkg]
    }
    }

    debian: {
    package { 'mercurial':
      ensure => present,
    }
    }

    windows : {

    file { 'hg-ini' :
        ensure => present,
        path   => 'C:\Users\builduser\mercurial.ini',
        source => 'puppet:///modules/hg/mercurial.ini'
    }

    package { $pkg :
        ensure   => installed,
        name     => "Mercurial ${version} (x86)",
        source   => "${shared_drive}\\hg\\${pkg}-x86.msi",
    }
    }

    default : {
    }

    }
}
