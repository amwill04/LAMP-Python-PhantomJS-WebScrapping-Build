Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

include system-update
include system-packages
include profile-update
include mysql::server
include python
include git
include phantomjs
include install-phantomjs
include apache
include php
