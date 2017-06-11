#!/usr/bin/bash

echo "installing ansible"

sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm

sudo yum -y update

sudo yum -y install ansible

ansible --version
