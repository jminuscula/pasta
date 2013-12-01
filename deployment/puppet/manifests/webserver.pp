

class web {

    # Packages
    package{['memcached']:
      ensure => installed
    }

    # Node
    package{['nodejs', 'npm']:
      ensure => 'latest'
    }

    exec {'node_modules':
      provider => shell,
      command => 'npm install -g bower grunt',
      require => Package['npm']
    }

    # Database
    package{['couchdb']:
      ensure => installed
    }

    # Files
    file {'role':
      ensure => file,
      path => '/etc/role',
      content => "webserver\n"
    }

    # Web server
    class {'nginx': }
    nginx::resource::vhost{'pasta.local':
      ensure => present,
      server_name => ['pasta.local', '192.168.1.108'],
      listen_port => 80,
      index_files => ['index.html'],
      try_files => ['$uri', '$uri/', '=404'],
      www_root => '/opt/pasta/app/'
    }

    nginx::resource::location{'pasta.local/pasta/':
      vhost => 'pasta.local',
      proxy => 'http://localhost:5984',
      www_root => 'pasta',
    }

    # Reverse proxy for couchdb
    nginx::resource::upstream{'couchdb':
      ensure => present,
      members => ['localhost:5984']
    }

    nginx::resource::vhost{'db.pasta.local':
      ensure => present,
      proxy => 'http://couchdb'
    }

    exec {'nginx_sendfile_off':
      provider => shell,
      command => "sed -i -r 's/sendfile\\s+on/sendfile\\ off/' /etc/nginx/nginx.conf",
      require => Class['nginx']
    }

}

include common
include web
