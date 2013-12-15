class apache {

	package {"apache2":
		ensure => present,
	}

	service {"apache2":
			ensure => running,
			enable => true,
			require => Package["apache2"],
	}	

	apache::vhost { "hello-rails":
		document_root => "/home/rails/public_html/hello-rails/public",
	}

}

define apache::vhost(
	$port          = "80",
	$server_name   = $title,
	$document_root = "/var/www/${server_name}",
	) {

	include apache

	file { "/etc/apache2/sites-enabled/${server_name}.conf":
		content => template("rails/passenger-vhost.conf.erb"),
		owner   => "root",
		group   => "root",
		mode    => "755",
		require => Package["apache2"],
		notify  => Service["apache2"],
	}
