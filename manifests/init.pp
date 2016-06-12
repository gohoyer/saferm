# Class: saferm
# ===========================
#
# Install and configure safe-rm.
#
# Parameters
# ----------
#
# * `version`
# Specify safe-rm version in case of installation via tarball file.
# Default: 0.12
#
# * `blacklist`
# Specify an array of system directories to be protected.
# Default:
#  - /
#  - /bin
#  - /boot
#  - /dev
#  - /etc
#  - /home
#  - /initrd
#  - /lib
#  - /proc
#  - /root
#  - /sbin
#  - /sys
#  - /usr
#  - /usr/bin
#  - /usr/include
#  - /usr/lib
#  - /usr/local
#  - /usr/local/bin
#  - /usr/local/include
#  - /usr/local/sbin
#  - /usr/local/share
#  - /usr/sbin
#  - /usr/share
#  - /usr/src
#  - /var
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
# Examples
# --------
#
# @example
#    class { 'saferm': }
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
class saferm (
  $version = "0.12",
  $blacklist = [
    "/",
    "/bin",
    "/boot",
    "/dev",
    "/etc",
    "/home",
    "/initrd",
    "/lib",
    "/proc",
    "/root",
    "/sbin",
    "/sys",
    "/usr",
    "/usr/bin",
    "/usr/include",
    "/usr/lib",
    "/usr/local",
    "/usr/local/bin",
    "/usr/local/include",
    "/usr/local/sbin",
    "/usr/local/share",
    "/usr/sbin",
    "/usr/share",
    "/usr/src",
    "/var",
  ],
) {
  # TODO: include the other classes
}
