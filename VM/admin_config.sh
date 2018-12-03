apt-get install -y vim sudo mailutils unzip nginx
sh resources/ddos.sh
usermod -aG sudo oreo
cp resources/interfaces /etc/network/interfaces
echo "Port 21" >> /etc/ssh/sshd_config
service ssh restart
service networking restart
iptables-restore < resources/iptables
mkdir /root/scripts
cp resources/update_script.sh /root/scripts/
cp resources/check_crontab.sh /root/scripts/
crontab resources/crontab.bak
cp resources/aliases /etc/aliases
cp resources/html/* /var/www/html
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
cp resources/self-signed.conf /etc/nginx/snippets/self-signed.conf
