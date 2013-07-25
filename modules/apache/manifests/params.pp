class apache::params {
  if ( $::processorcount > 1 ) {
    $max_clients_real = 300
  } else {
    $max_clients_real = 150
  }
}
