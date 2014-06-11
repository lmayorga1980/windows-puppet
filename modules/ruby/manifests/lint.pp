
class ruby::lint inherits ruby{

  require ruby

  exec { 'puppet-lint':
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install puppet-lint -v '0.3.2' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list puppet-lint -i"
  }
}