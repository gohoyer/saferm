# Class: saferm::params
# ===========================
#
# Private class for safe-rm smart parameters.
#
#
# Variables
# ----------
#
# * `install_method`
#  Installation method acording to the operating system:
#    - Debian: install via package manager
#    - RedHat: install via tarball
#
# * `package_name`
#  Safe-rm package name
#
# * `bin_path`
#  Path to safe-rm binary file
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
class saferm::params {
  case $::osfamily {
    'Debian': {
      $install_method = 'package'
      $package_name   = 'safe-rm'
      $bin_path       = '/usr/bin/'
    }
    'RedHat': {
      $install_method = 'tarball'
      $package_name   = undef
      $bin_path       = '/usr/bin/'
    }
    default: {fail("OS ${::osfamily} is unsupported by this module.")}
  }
}
