rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm
yum -y install zabbix-agent
export HOSTNAME=$(hostname)
curl https://raw.githubusercontent.com/enugentdt/eamonn-random/master/Scripts/mgmt/zabbix/zabbix_agentd.conf -O /etc/zabbix/zabbix_agentd.conf
sed -i 's/Hostname=zabbix-hostname/Hostname=$HOSTNAME' /etc/zabbix/zabbix_agentd.conf
systemctl start zabbix-agent
systemctl enable zabbix-agent
firewall-cmd --permanent --add-port=10050/tcp
firewall-cmd --permanent --add-port=10051/tcp
firewall-cmd --reload
