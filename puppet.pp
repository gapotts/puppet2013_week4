file { '/tmp/puppet.txt':
  content => hiera('puppet'),
}


