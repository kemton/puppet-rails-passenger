class rails::passenger {

#	include rails::apache

	package {"libapache2-mod-passenger":
                ensure => present,
        }

	exec { "enable-libapache2-mod-passenger":
		command => "/usr/sbin/a2enmod passenger",
		notify => Service["apache2"],
		require => [
#			Class["rails::apache"],
			Package["libapache2-mod-passenger"],
		],
	}

}
