class elasticsearch::install inherits elasticsearch {
  class { 'java':
#    version      => '6b18-1.8.13-0+squeeze2',
    version      => '6.26-0squeeze1',
    distribution => 'sun-jre'
  }
  Exec {
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin, '
  }
  exec { 'get_deb':
    command => 'curl -L -O https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-0.19.1.deb',
    cwd     => '/usr/src',
    creates => '/usr/src/elasticsearch-0.19.1.deb',
  }

  exec { 'install_deb':
    command => 'dpkg -i /usr/src/elasticsearch-0.19.1.deb',
    require => [ Exec['get_deb'], Class['java'] ],
    unless  => 'dpkg -s elasticsearch | grep -q 0.19'
  }
}
