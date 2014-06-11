
class ruby::savon inherits ruby{

  require ruby

  exec { 'savon' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install savon -v '2.4.0' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list savon -v 2.4.0 -i"
  }
}
