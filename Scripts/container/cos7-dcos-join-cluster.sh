#!/bin/sh
TYPE=$1
HOSTNAME=$2

if [ -z "$TYPE" ]
then
  echo "Command incorrect. Usage: (script) <TYPE> <HOSTNAME>"
  exit 1
fi

if [ -z "$HOSTNAME" ]
then
  echo "Command incorrect. Usage: (script) <TYPE> <HOSTNAME>"
  exit 1
fi

hostnamectl set-hostname $HOSTNAME

setenforce 0
sed -i -e 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

systemctl stop firewalld
systemctl disable firewalld
systemctl mask firewalld

yum -y install docker
systemctl start docker
systemctl enable docker

groupadd nogroup
groupadd docker

sudo mkdir -p /opt/dcos_install_tmp
sudo tar xf dcos-install.tar -C /opt/dcos_install_tmp
sudo bash /opt/dcos_install_tmp/dcos_install.sh $TYPE
