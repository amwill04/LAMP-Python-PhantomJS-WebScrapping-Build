class mysql::server {

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

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -proot",
    path => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password root",
    require => Service["mysql"],
  }

  exec { 'sudo apt-get mysql-connector':
  command => "sudo apt-get install python-mysql.connector -y",
  require => Exec['apt-get upgrade']
  }
}
