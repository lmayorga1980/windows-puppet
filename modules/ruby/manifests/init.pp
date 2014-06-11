
class ruby ($version = '2.0.0-p451') {

  $pkg = "ruby-${version}"

  case $::operatingsystem {

    redhat : {

    file { $pkg:
      ensure => present,
      path   => '/tmp/install-ruby.sh',
      mode   => '0755',
      source => 'puppet:///modules/ruby/install-ruby.sh'
    }

    exec { $pkg :
      creates   => '/usr/local/bin/ruby',
      command   => '/bin/bash /tmp/install-ruby.sh',
      logoutput => true,
      timeout   => 1200,
      require   => File[$pkg]
    }

    exec { 'puppet-parse':
      command   => '/usr/local/bin/gem install puppet-parse -f',
      logoutput => true,
      require   => Exec[$pkg],
      unless    => '/usr/local/bin/gem list puppet-parse -i'
    }
    }

    windows : {

    exec { $pkg :
      creates   => "C:\\${pkg}\\bin",
      command   => "${shared_drive}\\ruby\\${pkg}.exe /verysilent /dir=\"C:\\${pkg}\" /tasks=\"assocfiles,modpath\"",
      logoutput => true,
    }
    }

    default : {
    }
  }
}
