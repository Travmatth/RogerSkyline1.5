apt-get install -y vim sudo mailutils
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
