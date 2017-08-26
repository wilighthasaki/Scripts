sudo mv /etc/hosts.bak /etc/hosts.copy
sudo mv /etc/hosts /etc/hosts.bak
sudo mv /etc/hosts.copy /etc/hosts

sudo mv /etc/resolv.conf /etc/resolv.conf.copy
sudo mv /etc/resolv.conf.bak /etc/resolv.conf
sudo mv /etc/resolv.conf.copy /etc/resolv.conf.bak
/etc/init.d/networking restart

