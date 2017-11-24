echo "What is the hostname?"
read hostname
echo "What is the IP?"
read ip
echo "What is a descriptive name for it?"
read name


echo "
define host {
        use                             linux-server
        host_name                       $hostname
        alias                           $name
        address                         $ip
        max_check_attempts              5
        check_period                    24x7
        notification_interval           30
        notification_period             24x7
}
define service {
        use                             generic-service
        host_name                       $hostname
        service_description             PING
        check_command                   check_ping!100.0,20%!500.0,60%
}" >> /usr/local/nagios/etc/servers/$ip.cfg
systemctl reload nagios
