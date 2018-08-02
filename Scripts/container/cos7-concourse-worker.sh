yum -y install docker

systemctl stop firewalld
systemctl disable firewalld
systemctl mask firewalld
systemctl start docker
systemctl enable docker

setenforce 0
sed -i -e 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

groupadd docker

wget https://github.com/concourse/concourse/releases/download/v4.0.0/concourse_linux_amd64 -O /usr/bin/concourse

mkdir /root/concourse
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC33E51RyFWMyZ/RDfHlpyQb9oz0djYNYmg6+f1w1Rbht53AzSRypWCczc2JDJAuBVCV9V92qQAHTly10DIzkuUr91QLUbXJAz3NdCkaMooVPWTt3AcJ4wCIEiRk+Fgm0zlPCEB4uOcXw5mFg68Kb41/TpTRAgkHV6q7EI+BJ7V8q3+pxefJoDTv80ttrBH8nW5OTtulvkS+LGT76K5n0k7Jew2NsQqDZPfgV/I1/4L7JHuUMazLqq9oUuHREQaZdd8k4iw0vU0VM4NbeGeMs0zXs4G1QScOPokH9sqjuYwH6ZbgPU8U2RGDw0+CEk3vkvlkr1rkLNumqwChVnOs3ZN root@concourse.stm.inf.demilletech.net" > /root/concourse/tsa_host_key.pub

echo "[Unit]
Description=Concourse Docker
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/concourse worker --work-dir /opt/concourse/worker --tsa-host 10.101.101.41:2222 --tsa-public-key /root/concourse/tsa_host_key.pub --tsa-worker-private-key /root/.ssh/id_rsa

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/concourse-worker.service

systemctl daemon-reload
systemctl start concourse-worker
