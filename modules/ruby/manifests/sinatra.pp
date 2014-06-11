
class ruby::sinatra inherits ruby{

  require ruby

  exec { 'sinatra' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install sinatra -v '1.4.2' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list sinatra -i",
    timeout   => 900
  }
}