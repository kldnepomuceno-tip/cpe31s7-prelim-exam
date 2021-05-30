#/bin/bash

sudo cp /vagrant/keys/* /home/vagrant/.ssh/
sudo chown -R vagrant. /home/vagrant/.ssh/
sudo chmod 600 /home/vagrant/.ssh/id_rsa
sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
sudo cat /home/vagrant/.ssh/id_rsa.pub | tee -a /home/vagrant/.ssh/authorized_keys

sudo install git -y
sudo dnf makecache -y
sudo dnf install epel-release -y
sudo dnf makecache -y
sudo dnf install ansible -y
sudo dnf install vim -y

mkdir /home/vagrant/prelim-exam
touch prelim-exam/ansible.cfg
echo "[defaults]" >> prelim-exam/ansible.cfg
echo "inventory = ./inventory" >> prelim-exam/ansible.cfg
echo "remote_user = vagrant" >> prelim-exam/ansible.cfg
echo "host_key_checking = False" >> prelim-exam/ansible.cfg
echo "[privilege_escalation]" >> prelim-exam/ansible.cfg
echo "become = True" >> prelim-exam/ansible.cfg
echo "become_method = sudo" >> prelim-exam/ansible.cfg
echo "become_user = root" >> prelim-exam/ansible.cfg
echo "become_ask_pass = False" >> prelim-exam/ansible.cfg

touch prelim-exam/inventory
echo "[ansible]" >> prelim-exam/inventory
echo "10.67.17.10" >> prelim-exam/inventory
echo "[target]" >> prelim-exam/inventory
echo "10.67.17.11" >> prelim-exam/inventory
sudo cp /vagrant/main.yaml /home/vagrant/prelim-exam/
