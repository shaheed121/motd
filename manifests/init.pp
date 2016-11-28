# Class: motd
# ===========================
#
# This module manages the Message of the day.
#
# Examples
# --------
#
# @example
#   class { '::motd': }
#
# Authors
# -------
#
# Abdul Shaheed <shaheed121@gmail.com>
#
class motd {

  concat { 'motd':
    ensure => present,
    path   => '/etc/motd',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { 'motd/motd_header':
    target  => 'motd',
    order   => '10',
    content => epp('motd/motd_header.epp'),
  }

  concat::fragment { 'motd/motd_footer':
    target  => 'motd',
    order   => '90',
    content => epp('motd/motd_footer.epp'),
  }
}
