class apache {
  package {"apache2":
  ensure => "installed",
  require => Exec["apt-get upgrade"]}

  exec {"restart-apache":
  command => "sudo service apache2 restart",
  require => Class["php"]}
}
