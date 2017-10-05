yum -y install gcc httpd-devel mod_wsgi
export mod_wsgi_github_dl_url=`curl -s https://api.github.com/repos/GrahamDumpleton/mod_wsgi/releases/latest | grep tarball_url | cut -d '"' -f 4`
wget -O mod_wsgi.tar.gz $mod_wsgi_github_dl_url
mkdir mod_wsgi
tar -xvf mod_wsgi.tar.gz -C mod_wsgi
cd mod_wsgi
cd *
./configure --with-apxs=/usr/bin/apxs --with-python=/usr/bin/python3
make
make install
