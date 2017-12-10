yum -y install epel-release
yum -y install nginx
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
systemctl start nginx
systemctl enable nginx
