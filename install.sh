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
    curl https://gist.githubusercontent.com/lalmat/f1c392ae91d1d4361d4c2b2fc69f6515/raw/bf08369bba9f99b62cd75b37f81eb255b39483e9/.gitconfig > ~/.gitconfig

    echo "Configuring .gitconfig :"
    read -p "Enter your Fullname : " USER_FULLNAME
    sed -i -e "s/USER_FULLNAME/${USER_FULLNAME}/g" ~/.gitconfig

    read -p "Enter your E-mail : " USER_EMAIL
    sed -i -e "s/USER_EMAIL/${USER_EMAIL}/g" ~/.gitconfig
fi

echo "-------------------------------------------------------------------------------"
echo "Installing Ansible"
sudo apt install software-properties-common --yes
sudo apt install ansible --yes

echo "-------------------------------------------------------------------------------"
echo "Ansible ready, just start your ansible pull"
