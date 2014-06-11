
class ruby::nokogiri inherits ruby{

  require ruby

  exec { 'nokogiri' :
    command   => "C:\\${ruby::pkg}\\bin\\gem.bat install nokogiri -v '1.6.1' --no-rdoc --no-ri ",
    logoutput => true,
    unless    => "C:\\${ruby::pkg}\\bin\\gem.bat list nokogiri -v 1.6.1 -i"
  }
}
