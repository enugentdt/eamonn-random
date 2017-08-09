cd ~
mkdir mysql
cd mysql
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
sudo yum install mysql-server -y
firewall-cmd --permanent --add-service=mysql
firewall-cmd --reload
sudo systemctl start mysqld
grep 'temporary password' /var/log/mysqld.log
