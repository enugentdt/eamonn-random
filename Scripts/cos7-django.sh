yum -y install epel-release

yum -y install python34 python34-devel python34-pip
yum -y install gcc gcc-c++

echo "alias pip='python3 -m pip'" >> ~/.bashrc
source .bashrc

pip install --upgrade pip
pip install django django-admin

mkdir -p /etc/httpd/sites-available/
mkdir -p /etc/httpd/sites-enabled/
mkdir -p /var/log/sites/django_project/
mkdir -p /var/www/django_project
cd /var/www/django_project

django-admin startproject django_app

echo '<VirtualHost *:443>
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/html/django_project/
    ErrorLog /var/log/sites/django_project/error.log
    CustomLog /var/log/sites/django_project/requests.log combined
    SSLEngine on
    SSLCertificateFile "/var/www/django_project/site.crt"
    SSLCertificateKeyFile "/var/www/django_project/pk.key"
    SSLCipherSuite ALL:!aNULL:RC4+RSA:+HIGH:+MEDIUM:+LOW:+EXP:+eNULL

    WSGIDaemonProcess httpd_django python-path=/var/www/django_project/django_app:/lib/python3.4/site-packages
    WSGIProcessGroup httpd_django
    WSGIScriptAlias / /var/www/html/django_project/django_app/wsgi.py process-group=httpd_django application-group=%{GLOBAL}

    <Directory /var/www/django_project/django_app/>
        <Files wsgi.py>
            Require all granted
        </Files>
    </Directory>

    <Directory />
        AllowOverride All
        Require all granted
        Allow from all
    </Directory>
</VirtualHost>' >> /etc/httpd/sites-available/django.conf

ln -s /etc/httpd/sites-available/django.conf /etc/httpd/sites-enabled/django.conf
echo "IncludeOptional sites-enabled/*" >> /etc/httpd/httpd.conf

yum install -y policycoreutils-python
chcon -R -t httpd_log_t /var/log/sites
chown -R apache:apache /var/www
chown -R apache:apache /var/log/sites
