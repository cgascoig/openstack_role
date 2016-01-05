# openstack_role

## Overview

Puppet module containing role classes for openstack installation. 

## Module Description

Uses openstack_profiles to install and configure the following OpenStack components:

* keystone
* glance
* horizon
* nova on a controller node
* neutron on a controller node
* nova on a compute node
* neutron on a compute node

As well as their major requirements such as:

* mysql
* rabbitmq

## Usage

See http://github.com/cgascoig/openstack_profile for the profile classes.

What these roles/profiles do not do (now), that you should probably do manually:

* Interface configuration (importantly, MTU config - this will bite you if you use VXLAN)
* Create br-ex (ovs-vsctl add-br br-ex) on the network / controller node
* Upgrade all packages before adding the OpenStack repos
* Disable firewall on CentOS


Tested on CentOS 7, and partially on Ubuntu 14.04.3

