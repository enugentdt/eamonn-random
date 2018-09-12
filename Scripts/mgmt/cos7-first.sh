yum install wget cockpit zip bind-utils unzip firewalld git -y
systemctl restart firewalld
systemctl enable firewalld
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
systemctl start cockpit
systemctl enable cockpit
echo "$((RANDOM % 60)) $((RANDOM % 24)) * * $((RANDOM % 7)) root yum -y upgrade; yum -y update" >> /etc/crontab
