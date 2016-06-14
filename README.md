# saferm

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with saferm](#setup)
    * [What saferm affects](#what-saferm-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with saferm](#beginning-with-saferm)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This puppet module installs and configure [safe-rm](https://launchpad.net/safe-rm), a tool to prevent accidental deletion of important files and directories.

If you want to know more about the safe-rm tool, take a look at the official page [here](https://launchpad.net/safe-rm).

## Setup

### What saferm affects

- ```/etc/safe-rm.conf```
- ```/usr/bin/safe-rm```  

Optionally:
- ```/etc/profile.d/safe-rm.sh```
- ```~/.safe-rm```

### Setup requirements
This module needs tar and wget to work properly.

### Beginning with saferm

To install safe-rm on your system, include the ```saferm``` class: ```include saferm```.

## Usage

The saferm module install and configure safe-rm on your system. By default, the module install version 0.12 and shields the following directories:  
- /
- /bin
- /boot
- /dev
- /etc
- /home
- /initrd
- /lib
- /proc
- /root
- /sbin
- /sys
- /usr
- /usr/bin
- /usr/include
- /usr/lib
- /usr/local
- /usr/local/bin
- /usr/local/include
- /usr/local/sbin
- /usr/local/share
- /usr/sbin
- /usr/share
- /usr/src
- /var  

To install a different version of safe-rm:  
~~~
class {'saferm':
  version => '0.11'
}
~~~

To set a different list of directories to be protected:  
~~~
class {'saferm':
  blacklist => ["/home","/home/user","/my_custom_dir"]'
}
~~~
The directories passed on the ```blacklist``` variable of the ```saferm``` class are system wide and will affect all users.

The defined type ```saferm::user_blacklist``` allow you to specify a custom list of directories to be protected for each user.  
~~~
saferm::user_blacklist {'/home/bob/':
  blacklist => [
    '/home/bob/documents',
    '/home/bob/photos',
    '/bob_protected_dir',
  ]
}
~~~

The class ```saferm::alias``` creates an alias to the rm command pointing to safe-rm.
~~~
include saferm::alias
~~~
This will create a permanent the alias ```rm="/usr/bin/safe-rm"``` at ```/etc/profile.d/safe-rm.sh```.

## Reference

### Classes

#### Public classes
* `saferm`: Install and configure safe-rm.
* `saferm::alias`: creates an alias to the `rm` command.

#### Private classes
* `saferm::params`: Determines the installation method, the binary path and the package name for safe-rm.
* `saferm::install`: install safe-rm according the installation method.
* `saferm::config`: configures safe-rm.

### Defined types
* `saferm::user_blacklist`: Creates a safe-rm configuration file at the home of the user containing a custom set of directories to be protected for this user. The `$title` of this define must be the user home.

### Parameters
The following parameters are avaliable in `saferm`:

#### version
Specifies the safe-rm version to be installed.  
Valid options: '0.12', '0.11', '0.10'.  
Default: '0.12'  

#### blacklist
Specifies an array of directories to be protected system wide.  
Default:  
- /
- /bin
- /boot
- /dev
- /etc
- /home
- /initrd
- /lib
- /proc
- /root
- /sbin
- /sys
- /usr
- /usr/bin
- /usr/include
- /usr/lib
- /usr/local
- /usr/local/bin
- /usr/local/include
- /usr/local/sbin
- /usr/local/share
- /usr/sbin
- /usr/share
- /usr/src
- /var

The following parameters are avaliable in `saferm::user_blacklist`:

#### blacklist
Requird parameter that specifies an array of directories to be protected on the user environment.
Default: there's no default value for this parameter.

## Limitations

This module cannot guarantee installation of safe-rm versions that aren't avaliable on platform repositories for Debian like systems.

This module is tested on the following OS:
- CentOS 5.x
- CentOS 6.x
- Centos 7.x
- Debian 6.x
- Debian 7.x
- Debian 8.x

## Development

Feel free to contribute for this module at the module's [github repo](https://github.com/gohoyer/saferm).
