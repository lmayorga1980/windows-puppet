
class iis($features = ''){

  include iis::install, iis::configure, iis::aspnet, iis::winauth

  Class['iis::install'] -> Class['iis::configure'] -> Class['iis::aspnet'] -> Class['iis::winauth']
}

