$accounts = hiera('accounts')
create_resources('user', $accounts)

