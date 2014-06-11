
class curl ($version = '7.32.0') {

  file { 'curl':
    ensure  => present,
    path    => 'C:\Utils\curl.exe',
    source  => 'puppet:///puppetfs/curl/curl.exe',
    mode    => '0755',
  }

  file { 'curlcert':
    ensure  => present,
    path    => 'C:\Utils\cacert.pem',
    source  => 'puppet:///modules/curl/cacert.pem',
    mode    => '0755',
  }
}
