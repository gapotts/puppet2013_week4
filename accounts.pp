class accounts {
  $accounts = hiera('accounts')
  create_resources('user', $accounts)
}

include accounts

