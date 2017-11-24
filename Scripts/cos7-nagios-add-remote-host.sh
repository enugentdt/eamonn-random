yum install epel-release
yum install nrpe nagios-plugins-all

sed 's/allowed_hosts=127.0.0.1,::1/allowed_hosts=127.0.0.1,::1,10.101.22.50/w' /etc/nagios/nrpe.cfg

systemctl start nrpe.service
systemctl enable nrpe.service
