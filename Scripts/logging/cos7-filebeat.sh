rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
echo "[elastic-6.x]
name=Elastic repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" >> /etc/yum.repos.d/elasticsearch.repo
yum -y install filebeat
systemctl enable filebeat
echo "Please remember to start filebeat after editing the configuration file, located at /etc/filebeat/filebeat.yml"
