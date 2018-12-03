ssh-keygen -t rsa -b 4096 -C "eruaud@student.le-101.fr" -q -N ""
chmod 400 "~/.ssh/id_rsa.pub"
ssh-copy-id oreo@192.168.99.2 -p 21
scp -r -P 21 -p VM oreo@192.168.99.2:/home/oreo
