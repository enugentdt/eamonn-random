yum -y install epel-release
yum -y install nrpe nagios-plugins-all

systemctl start nrpe.service
systemctl enable nrpe.service

sed 's/allowed_hosts=127.0.0.1,::1/allowed_hosts=127.0.0.1,::1,10.101.22.50/w' /etc/nagios/nrpe.cfg
