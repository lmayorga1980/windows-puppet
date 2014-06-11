class ruby::termansicolor inherits ruby{

  require ruby

  exec { 'termansicolor' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install term-ansicolor -v '1.3.0' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list term-ansicolor -i"
  }
}