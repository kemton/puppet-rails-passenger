class rails::rvm {

	package {"curl":
		ensure => present,
	}

	exec {"install-rvm":
		command => "curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles",
		path    => "/usr/local/bin/:/usr/bin/:/bin/",
		require => Package["curl"],
	}

}
