
class master {

  cron { 'dev_hiera':
    ensure  => 'present',
    command => 'cd /puppet/hiera/development && git pull',
    minute  => '*/5',
    hour    => '*',
    weekday => '*',
    month   => '*',
    user    => 'pe-puppet',
  }

  cron { 'prod_hiera':
    ensure  => 'present',
    command => 'cd /puppet/hiera/production && git pull',
    minute  => '*/5',
    hour    => '*',
    weekday => '*',
    month   => '*',
    user    => 'pe-puppet',
  }

  cron { 'dev_modules':
    ensure  => 'present',
    command => 'cd /puppet/modules/development && git pull',
    minute  => '*/5',
    hour    => '*',
    weekday => '*',
    month   => '*',
    user    => 'pe-puppet',
  }

  cron { 'prod_modules':
    ensure  => 'present',
    command => 'cd /puppet/modules/production && git pull',
    minute  => '*/5',
    hour    => '*',
    weekday => '*',
    month   => '*',
    user    => 'pe-puppet',
  }

  cron { 'clean dashboard logs':
    ensure  => 'present',
    command => 'sudo /opt/puppet/bin/rake -f /opt/puppet/share/puppet-dashboard/Rakefile RAILS_ENV=production reports:prune upto=3 unit=day',
    minute  => '*',
    hour    => '23',
    weekday => '*',
    month   => '*',
    user    => 'pe-puppet',
  }

  file {'/mnt/puppetfs':
    ensure => directory,
    before => File['smb credentials'],
  }

  file { 'smb credentials':
    path    => '/etc/auto.smb.credentials',
    content => template('master/auto.smb.credentials.erb'),
    mode    => '0750',
  } ->

  exec { 'smb credentials endings':
    command   => "sed -i $'s/\r$//' /etc/auto.smb.credentials",
    logoutput => true,
    unless    => 'file /etc/auto.smb.credentials | grep -v CRLF',
    path      => '/usr/bin:/bin',
  } ->

  mount { 'puppet file system share':
    ensure  => 'mounted',
    name    => '/mnt/puppetfs',
    device  => '//<your windows share>/shardirs/shardata/puppet',
    fstype  => 'cifs',
    atboot  => true,
    options => 'auto,credentials=/etc/auto.smb.credentials',
  }
}