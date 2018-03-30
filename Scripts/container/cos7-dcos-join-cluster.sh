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

sudo mkdir -p /opt/dcos_install_tmp
sudo tar xf dcos-install.tar -C /opt/dcos_install_tmp
sudo bash /opt/dcos_install_tmp/dcos_install.sh $TYPE
