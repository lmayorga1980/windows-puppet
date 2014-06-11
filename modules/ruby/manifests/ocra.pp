
class ruby::ocra inherits ruby{

  require ruby

  exec { 'ocra' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install ocra -v '1.3.1' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list ocra -i"
  }
}