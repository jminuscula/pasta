
class common{

  Exec{
    path => "/bin:/sbin:/usr/bin:/usr/sbin"
  }
  
  include auth

  exec { 'apt-update':
    command => "/usr/bin/apt-get update -y"
  }

  # sys packages
  package{['avahi-daemon',
           'libjpeg8', 'libjpeg-dev', 'libwebp-dev', 'libwebp2', 
           'libfreetype6', 'libfreetype6-dev']:
    ensure => installed
  }

  # dev packages
  package{['vim', 'git', 'mercurial', 'curl']:
    ensure => installed
  }

}
