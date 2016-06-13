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
  $version = '0.12',
  $blacklist = [
    '/',
    '/bin',
    '/boot',
    '/dev',
    '/etc',
    '/home',
    '/initrd',
    '/lib',
    '/proc',
    '/root',
    '/sbin',
    '/sys',
    '/usr',
    '/usr/bin',
    '/usr/include',
    '/usr/lib',
    '/usr/local',
    '/usr/local/bin',
    '/usr/local/include',
    '/usr/local/sbin',
    '/usr/local/share',
    '/usr/sbin',
    '/usr/share',
    '/usr/src',
    '/var',
  ],
) {

  # Validate parameters
  include '::saferm::install'
  include '::saferm::config'

  anchor { 'saferm::start': }
  anchor { 'saferm::end': }

  Anchor['saferm::start'] ->
  Class['saferm::config'] ->
  Class['saferm::install'] ->
  Anchor['saferm::end']

}
