
class ruby::win32api inherits ruby{

  require ruby

  exec { 'win32-api' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install win32-api  --no-rdoc --no-ri",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list win32-api -i"
  }
}