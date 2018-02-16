yum install wget cockpit zip bind-utils unzip firewalld -y
systemctl restart firewalld
systemctl enable firewalld
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
systemctl start cockpit
systemctl enable cockpit
