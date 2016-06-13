# Class: saferm::alias
# ===========================
#
# Creates an alias to the rm command for all users.
#
# @example
#    include saferm::alias
#
#
# Authors
# -------
#
# Gustavo Hoyer <gustavo.hoyer@gmail.com>
#
# Copyright
# ---------
#
# Copyright (C) 2016 Gustavo Hoyer.
#
# Published under the Apache License v2.0
#
class saferm::alias {

  include saferm::params

  $blacklist = $saferm::blacklist

  file {'/etc/profile.d/safe-rm.sh':
    ensure  => file,
    content => template('saferm/etc/profile.d/safe-rm.sh.erb')
  }
}
