
class ruby::bundler inherits ruby {

  require ruby

  exec { 'bundler' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install bundler -v '1.3.5' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list bundler -i"
  }
}
