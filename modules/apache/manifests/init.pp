class apache (
   $max_clients = $apache::params::max_clients,
) inherits apache::params {

  include apache::packages
  include apache::config
  include apache::services

  Class['apache::packages'] ->
  Class['apache::config'] ~>
  Class['apache::services']
}
