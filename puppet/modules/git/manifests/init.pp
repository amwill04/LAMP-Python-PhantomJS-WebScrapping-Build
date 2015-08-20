class git {
  package{"git":
  ensure => "installed",
  require => Exec['apt-get upgrade']
  }
}
