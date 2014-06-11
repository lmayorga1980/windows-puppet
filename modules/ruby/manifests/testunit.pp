
class ruby::testunit inherits ruby{

  require ruby

  exec { 'test-unit' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install test-unit -v '2.5.5' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list test-unit -v '2.5.5' -i"
  }
}