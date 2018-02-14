rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y puppet-agent
systemctl start puppet
systemctl enable puppet
