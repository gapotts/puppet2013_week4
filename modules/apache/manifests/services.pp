class apache::services {
  service { 'httpd':
    ensure => 'running',
    enable => true,
  }
}
