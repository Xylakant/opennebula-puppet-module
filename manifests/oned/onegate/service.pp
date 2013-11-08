# == Class one::oned::onegate::service
#
# Installation and Configuration of OpenNebula
# http://opennebula.org/
#
# === Author
# ePost Development GmbH
# (c) 2013
#
# Contributors:
# - Martin Alfke
# - Achim Ledermüller (Netways GmbH)
# - Sebastian Saemann (Netways GmbH)
# - Matthias Schmitz
# === License
# Apache License Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0.html
#
class one::oned::onegate::service {
  # init script will be available in version 4.4
  # http://dev.opennebula.org/issues/2183
  #service {'onegate-server':
  #  hasstatus => true,
  #  enable => true,
  #  ensure => running,
  #}
  service {'onegate-server':
    ensure     => running,
    provider   => 'base',
    hasstatus  => false,
    hasrestart => false,
    start      => '/bin/su -c "/usr/bin/onegate-server start" oneadmin',
    stop       => '/bin/su -c "/usr/bin/onegate-server stop" oneadmin ',
    enable     => true,
    path       => '/usr/bin/'
  }
}
