
class ruby::trollop inherits ruby{

  require ruby

  exec { 'trollop' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install trollop -v '2.0' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list trollop -v 2.0 -i"
  }
}
