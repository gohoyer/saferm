# Class: saferm::install
# ===========================
#
# Top-level safe-rm installation class.
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
class saferm::install {

  $version = $saferm::version

  case $saferm::params::install_method {
    'package': {
      package {"$saferm::params::package":
        ensure => 'present'
      }
    }
    'tarball': {
      exec{'Download safe-rm':
        command => "wget -q https://launchpad.net/safe-rm/trunk/${version}/+download/safe-rm-${version}.tar.gz -O /usr/src/",
        path    => '/usr/bin',
        creates => "/usr/src/safe-rm-${version}.tar.gz",
      }
      exec{'Uncompress safe-rm':
        command => "tar -xzf /usr/src/safe-rm-${version}.tar.gz safe-rm-${version}/safe-rm --strip-components=1 -C /usr/bin/"
      }
    }
    default: {
      fail("Module ${name} doesn't support ${saferm::params::install_method} as an installation method.")
    }
  }
}
