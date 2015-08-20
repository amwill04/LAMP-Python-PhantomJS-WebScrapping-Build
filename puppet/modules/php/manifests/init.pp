class php {
  package {["php-pear", "php5", "php5-cgi",
            "php5-cli", "php5-common", "php5-curl",
            "php5-fpm", "php5-gd", "php5-imagick",
            "php5-intl", "php5-json", "php5-mcrypt",
            "php5-memcache", "php5-memcached",
            "php5-mysql", "php5-mysqlnd", "php5-pgsql",
            "php5-readline", "php5-redis", "php5-sqlite"]:
  ensure => "installed",
  require => Exec["apt-get upgrade"]
  }

  file { "/etc/php5/apache2/php.ini":
  ensure => present,
  mode => "0755",
  source => "puppet:///modules/php/php.ini",
  require => Package["apache2"]
  }
}
