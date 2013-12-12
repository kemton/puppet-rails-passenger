class rails::passenger {

	require apache

	package {"libapache2-mod-passenger":
		ensure => present,
		require => [
			Class["apache"],
		],
	}

	exec { "enable-libapache2-mod-passenger":
		command => "/usr/sbin/a2enmod passenger",
		require => [
			Package["libapache2-mod-passenger"],
		],
	}

}
