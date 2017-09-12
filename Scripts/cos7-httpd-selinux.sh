yum install -y policycoreutils-python

semanage fcontext -a -t httpd_sys_content_t "/var/www(/.*)?"
restorecon -Rv /var/www
