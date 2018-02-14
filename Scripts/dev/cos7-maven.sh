yum -y remove maven
cd ~
wget http://mirrors.sonic.net/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
tar -xvf apache-maven-3.5.0-bin.tar.gz
cd apache-maven-3.5.0-bin
cd bin
ln -s /root/apache-maven-3.5.0-bin/bin/mvn /bin/mvn
