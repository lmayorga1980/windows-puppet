
class mongodb ($version = '2.6.1') {

  require sevenzip

  $pkg = "mongodb-win32-x86_64-2008plus-${version}"

  include mongodb::install, mongodb::configure

  Class['mongodb::install'] -> Class['mongodb::configure']


}
