# motd

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with motd](#setup)
    * [What motd affects](#what-motd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with motd](#beginning-with-motd)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Configures the Message of the day (motd).

## Setup

### What motd affects **OPTIONAL**

This motd module manages the file /etc/motd and also provides functionality to add custom snippets.

### Beginning with motd

To begin with motd module, all you need to do is include `motd` class.
```
  include '::motd'
```

## Usage

Simply including the motd class will create basic motd file with below listed contents.
```
-------------------------------------------------
node1.example.net
CentOS 7.2.1511 x86\_64
Puppet   : 4.7.0
Facter   : 3.4.1
FQDN     : node1.local
IP       : 10.0.2.15
Processor: Intel(R) Core(TM) i5-5257U CPU @ 2.70GHz
Memory   : 489.04 MiB


-------------------------------------------------
 Custom section starts below:
-------------------------------------------------
   *End of MOTD file*
-------------------------------------------------
```

To add a custom snippet to motd file, all you need to do is use `motd::snippet` defined type.

```
  motd::snippet { 'test_snippet':
    content => "Test snippet which will be added in custom section.",
  }
```


## Reference

### Defined types

This motd module contains the following defined types:

#### Public Defined types

* [motd::snippet](#motdsnippet)

#### motd::snippet

This defined type adds custom contents into motd file in the custom section.

##### Parameters

The following parameters are available in the `::motd::snippet` defined type:

###### `content` (String)

Content to be added in the motd file. Can be either a string or a template.

###### `order` (Integer)

Specifies a order for sorting your contents within the custom section of the motd file.

## Limitations

Supported operating systems:
* Centos: 6, 7

Supported puppet versions:
* 4.5.0+
