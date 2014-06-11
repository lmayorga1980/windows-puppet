
class nodejs {

  include nodejs::install, nodejs::config

  Class['nodejs::install'] -> Class['nodejs::config']

}
