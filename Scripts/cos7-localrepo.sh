echo "[localrepo]
name=demilleTech Repository
baseurl=ftp://10.101.17.1/pub/localrepo
gpgcheck=0
enabled=1" > /etc/yum.repos.d/localrepo.repo

yum repolist
