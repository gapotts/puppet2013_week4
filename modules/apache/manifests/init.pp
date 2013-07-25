class apache (
   $max_clients = $apache::params::max_clients,
) inherits apache::params {

  if ! (is_integer($max_clients)) {
    fail("max_clients does not appear to be an integer: ${max_clients}")
  }

  include apache::packages
  include apache::config
  include apache::services

  Class['apache::packages'] ->
  Class['apache::config'] ~>
  Class['apache::services']
}
