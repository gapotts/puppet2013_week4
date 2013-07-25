class apache::params {
  if ( $::processorcount > 1 ) {
    $max_clients = 300
  } else {
    $max_clients = 150
  }
}
