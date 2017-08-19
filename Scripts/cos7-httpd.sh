yum -y install httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
systemctl enable httpd
systemctl start httpd
