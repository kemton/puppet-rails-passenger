class rails::rvm {

	package {"curl":
		ensure => present,
	}

	exec {"install-rvm":
		command => "curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles",
		path    => "/usr/local/bin:/usr/bin:/usr/sbin:/bin",
		require => Package["curl"],
		creates => "/usr/local/rvm/bin/rvm",
	}

}
