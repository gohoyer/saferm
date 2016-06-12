# Defined type: saferm::user_blacklist
# ===========================
#
# Creates ~/.safe-rm file in the user home containing the directories to be protect.
#
# Parameters
# ----------
#
# * `title`
# Specify the user home directory as the title of this defined type.
# Default: there's no default value for this parameter.
#
# * `blacklist`
# Specify an array of user directories to be protected.
# You should probably add paths like:
#  - /home/bob/documents
#  - /home/bob/photos
#  - /home/bob/my_protected_dir
# Default: there's no default value for this parameter.
#
# Examples
# --------
#
# @example
#    saferm::userblacklist { '/home/bob':
#      blacklist => [
#        '/home/bob/documents',
#        '/home/bob/photos',
#        '/home/bob/my_protected_dir'
#      ]
#    }
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
define saferm::user_blacklist (
  $blacklist
) {

  file {"${title}/.safe-rm":
    ensure  => file,
    content => template('saferm/safe-rm.conf.erb')
  }
}
