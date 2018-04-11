#!/bin/sh

# This is to be run BEFORE the CLI, and does NOT install DCOS for you. This will also run my oVirt Starter Package stuff

HOSTNAME=$1

if [ -z "$HOSTNAME" ]
then
  echo "Command incorrect. Usage: (script) <HOSTNAME>"
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

bash -c "$(curl -s https://raw.githubusercontent.com/enugentdt/eamonn-random/master/Scripts/mgmt/cos7-ovirt-agent.sh)"
bash -c "$(curl -s https://raw.githubusercontent.com/enugentdt/eamonn-random/master/Scripts/mgmt/cos7-first.sh)"
bash -c "$(curl -s https://raw.githubusercontent.com/enugentdt/eamonn-random/master/Scripts/mgmt/generic-add-ssh.sh)"

groupadd nogroup
groupadd docker # Fun fact: if you don't have this line, the install will mess up, and you *will* have to reimage the machine.

echo "Done"
