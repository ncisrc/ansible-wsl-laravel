#!/bin/bash
echo "-------------------------------------------------------------------------------"
echo "Updating System"
sudo apt update
sudo apt upgrade --yes
sudo apt dist-upgrade --yes

sudo apt install gcc make perl build-essential linux-headers-`uname -r` dkms

echo "-------------------------------------------------------------------------------"
echo "Add Ansible Official PPA"
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "-------------------------------------------------------------------------------"
echo "Installing GIT"
sudo apt install git --yes

if [ ! -f ~/.gitconfig ]; then
    echo "-------------------------------------------------------------------------------"
    echo "GITCONFIG"
    echo "Retrieving lalmat's .gitconfig :"
    curl https://gist.githubusercontent.com/lalmat/2f765c03fb4f3556021b26b28baf8d9f/raw/1d07a35b91a29019de69a731510a622815f3d5bb/gistfile1.txt > ~/.gitconfig

    echo "Configuring .gitconfig :"
    read -p "Enter your Fullname : " USER_FULLNAME
    sed -i -e "s/USER_FULLNAME/${USER_FULLNAME}/g" ~/.gitconfig

    read -p "Enter your E-mail : " USER_EMAIL
    sed -i -e "s/USER_EMAIL/${USER_EMAIL}/g" ~/.gitconfig
fi

echo "-------------------------------------------------------------------------------"
echo "Installing Ansible"
sudo apt install software-properties-common
sudo apt install ansible --yes --install-suggests

echo "-------------------------------------------------------------------------------"
echo "Ansible ready, just start your ansible pull"
