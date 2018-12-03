apt install vim sudo
usermod -aG sudo oreo
cp resources/interfaces /etc/network/interfaces
echo "Port 21" >> /etc/ssh/sshd_config
service ssh restart
service networking restart
iptables-restore < resources/iptables
