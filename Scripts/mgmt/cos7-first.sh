yum install wget cockpit zip bind-utils unzip -y
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
systemctl start cockpit
systemctl enable cockpit
