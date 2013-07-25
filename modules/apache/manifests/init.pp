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

  include apache::packages
  include apache::config
  include apache::services

  Class['apache::packages'] ->
  Class['apache::config'] ~>
  Class['apache::services']
}
