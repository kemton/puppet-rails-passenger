class puppet-rails-passenger {
  file { '/tmp/helloPuppet':
    content => "Hello Puppet!"
  }
}
