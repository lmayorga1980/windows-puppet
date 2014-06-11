
class netfx45 {

  case $::kernelrelease {

    '6.1.7601': {

    #package { 'DotNet4.5':
    #  ensure          => installed,
    #  provider        => 'chocolatey',
    #}

     package { 'netfx451':
       ensure          => installed,
       name            => "Microsoft .NET Framework 4.5.1",
       source          => "${shared_drive}\\netfx\\dotNetFx4.5.1.exe",
       install_options => [ '/q', '/norestart' ]
     }

    #  reboot {'after netframework451':
    #    subscribe => Package['netfx451']
    #  }
    }

    '6.3.9600': {
     # notify { "This operating system already ships with Net Framework 4.5.1" :}
    }

    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem} ${::operatingsystemrelease}")
    }
  }
}
