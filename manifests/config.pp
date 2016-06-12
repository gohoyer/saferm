# Class: saferm::config
# ===========================
#
# Top-level safe-rm configuration class.
#
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
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
class saferm::config {

  $blacklist = $saferm::blacklist

  file {'/etc/safe-rm.conf':
    ensure  => file,
    content => template('saferm/safe-rm.conf.erb')
  }
}
