class phantomjs {
  package {
    ["build-essential", "g++", "flex",
    "bison", "gperf", "ruby", "perl",
    "libsqlite3-dev", "libfontconfig1-dev",
    "libicu-dev", "libfreetype6", "libssl-dev",
    "libpng-dev", "libjpeg-dev", "libx11-dev", "libxext-dev"]:
    ensure => "installed",
    require => Class ["git"]
  }
}

class install-phantomjs (
  $source_url = undef,
  $source_dir = '/opt',
  $install_dir = '/usr/local/bin'
) {

  $pkg_src_url = $source_url ? {
    undef   => "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2",
    default => $source_url,
  }

  exec { 'get phantomjs':
    command => "/usr/bin/curl --silent --show-error --location ${pkg_src_url} --output ${source_dir}/phantomjs.tar.bz2 \
      && mkdir ${source_dir}/phantomjs \
      && tar --extract --file=${source_dir}/phantomjs.tar.bz2 --strip-components=1 --directory=${source_dir}/phantomjs",
    creates => "${source_dir}/phantomjs/",
    require => Class["phantomjs"]
  }

  file { "${install_dir}/phantomjs":
    ensure => link,
    target => "${source_dir}/phantomjs/bin/phantomjs",
    force  => true,
    require => Exec["get phantomjs"]
  }
}
