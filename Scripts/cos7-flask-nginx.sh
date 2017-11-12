yum -y install epel-release

yum -y install python34 python34-devel python34-pip
yum -y install gcc gcc-c++

echo "alias pip='python3 -m pip'" >> ~/.bashrc
source ~/.bashrc

useradd flaskusr

python3 -m pip install --upgrade pip
python3 -m pip install virtualenv

mkdir -p /home/flaskusr/flaskproj
cd /home/flaskusr/flaskproj

virtualenv flaskenv

source flaskenv/bin/activate

python3 -m pip install uwsgi flask

echo -e "from flask import Flask
application = Flask(__name__)

@application.route(\"/\")
def hello():
    return \"<h1 style='color:blue'>Hello There!</h1>\"

if __name__ == \"__main__\":
    application.run(host='0.0.0.0')" > flaskproj.py
    
echo -e "from flaskproj import application

if __name__ == \"__main__\":
    application.run()" > wsgi.py
    
deactivate
echo "[uwsgi]
module = wsgi

master = true
processes = 5

socket = myproject.sock
chmod-socket = 660
vacuum = true

die-on-term = true" > flaskproj.ini

echo "[Unit]
Description=uWSGI instance to serve flaskproj
After=network.target

[Service]
User=flaskusr
Group=nginx
WorkingDirectory=/root/flaskproj
Environment=\"PATH=/root/flaskproj/flaskenv/bin\"
ExecStart=/root/flaskproj/flaskenv/bin/uwsgi --ini flaskproj.ini

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/flaskproj.service

systemctl start flaskproj
systemctl enable flaskproj

chown -R flaskusr:nginx /home/flaskusr

usermod -a -G flaskusr nginx
chmod 710 /home/flaskusr

echo "
Please add the following to your /etc/nginx/nginx.conf default server entry:

location / {
        include uwsgi_params;
        uwsgi_pass unix:/home/flaskusr/flaskproj/flaskproj.sock;
    }

Press any key to continue"

read -n 1 -s

nginx -t

systemctl restart nginx
