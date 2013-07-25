class apache (
   $max_clients = undef,
) {

  if ( $max_clients ) {
    $max_clients_real = $max_clients
  } else {
    if ( $::processorcount > 1 ) {
      $max_clients_real = 300
    } else {
      $max_clients_real = 150
    }
  }

  package { 'httpd':
    ensure => 'installed',
  }

  package { 'php':
    ensure => 'installed',
  }

  package { 'mod_ssl':
    ensure => 'installed',
  }

  file { '/etc/httpd/conf/httpd.conf':
    content => template('apache/httpd.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => Package['httpd', 'php', 'mod_ssl'],
  }

  file { '/etc/php.ini':
    source => 'puppet:///modules/apache/etc/php.ini',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    require => Package['httpd', 'php', 'mod_ssl'],
  }

  file { '/etc/httpd/conf.d/port8080.conf':
    source => 'puppet:///modules/apache/etc/httpd/conf.d/port8080.conf',
    owner  => 'root',
    group  => 'root',
    require => Package['httpd', 'php', 'mod_ssl'],
  }

  file { '/var/www/port8080/':
    ensure => 'directory',
    mode   => '0664',
  }

  service { 'httpd':
    ensure => 'running',
    enable => true,
    subscribe => File['/etc/httpd/conf/httpd.conf',
                      '/etc/php.ini',
                      '/etc/httpd/conf.d/port8080.conf',
                      '/var/www/port8080'],
  }
}
