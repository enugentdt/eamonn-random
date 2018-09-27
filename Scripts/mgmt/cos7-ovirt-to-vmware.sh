systemctl stop ovirt-guest-agent.service
systemctl disable ovirt-guest-agent.service
yum -y remove ovirt-guest-agent-common
bash -c "$(curl -s https://raw.githubusercontent.com/enugentdt/eamonn-random/master/Scripts/mgmt/cos7-vmware-tools.sh)";
