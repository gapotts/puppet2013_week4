class apache::packages {
  package { 'httpd':
    ensure => 'installed',
  }

  package { 'php':
    ensure => 'installed',
  }

  package { 'mod_ssl':
    ensure => 'installed',
  }
}
