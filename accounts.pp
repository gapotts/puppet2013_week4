class accounts {
  user { 'alice':
    uid => 1000,
    gid => 'users',
  }

  user { 'bob':
    uid => 1001,
    gid => 'users',
  }

  user { 'carol':
    uid => 1002,
    gid => 'users',
  }

  user { 'dan':
    uid => 1003,
    gid => 'users',
  }

  #...
}

include accounts
