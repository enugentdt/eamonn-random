apt install wget curl zip unzip git bind-utils -y
echo "$((RANDOM % 60)) $((RANDOM % 24)) * * $((RANDOM % 7)) root apt -y upgrade; apt -y update" >> /etc/crontab
