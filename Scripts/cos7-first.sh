yum install wget cockpit -y
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
systemctl start cockpit
systemctl enable cockpit
