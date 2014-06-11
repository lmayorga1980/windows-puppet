
class ruby::selenium inherits ruby{

  require ruby

  exec { 'selenium' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install selenium-webdriver -v '2.32.1' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list selenium-webdriver -i"
  }
}