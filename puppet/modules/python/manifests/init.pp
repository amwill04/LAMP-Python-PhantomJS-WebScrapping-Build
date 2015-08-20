class python {
  package {["python-dev", "python-pip"]:
  ensure => ["installed"],
  require => Exec ['apt-get upgrade']
  }

  exec {
    "virtualenv" :
    command => "sudo pip install virtualenv",
    require => Package ["python-dev", "python-pip"]
  }

  exec {
    "virtuallenvwrapper" :
    command => "sudo pip install virtualenvwrapper",
    require => Exec ["virtualenv"]
  }

  exec {
    "splinter" :
    command => "sudo pip install splinter",
    require => Package ["python-dev", "python-pip"]
  }

  exec {
    "numpy" :
    command => "sudo pip install numpy",
    require => Package ["python-dev", "python-pip"],
    timeout => 0
  }

  exec {
    "pandas" :
    command => "sudo pip install pandas",
    require => Exec["numpy"],
    timeout => 0
  }

  exec {
    "bs4" :
    command => "sudo pip install BeautifulSoup4",
    require => Package ["python-dev", "python-pip"]
  }
}
