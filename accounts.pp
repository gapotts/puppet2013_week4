define accounts (
  $name = title,
  $uid  = undef,
  $gid  = undef,
  $key  = undef,
) {
  user { $title:
    uid => $uid,
    gid => $gid,
  }

  if ( $key ) {
    ssh_authorized_key { $title:
      user => $title,
      key  => $key,
      type => 'rsa',
    }
  }
}

$accounts = hiera_hash('accounts')
create_resources('accounts', $accounts)
