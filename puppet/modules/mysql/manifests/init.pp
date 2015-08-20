class mysql {

  package {
  ["mysql-server", "libapache2-mod-auth-mysql"]:
  ensure => "installed",
  require => Exec['apt-get upgrade']
  }

  service { "mysql":
  ensure    => running,
  enable    => true,
  require => Package["mysql-server"]
  }

  exec { 'sudo apt-get mysql-connector':
  command => "sudo apt-get install python-mysql.connector -y",
  require => Exec['apt-get upgrade']
  }
}
