#!/bin/sh
sudo apt update -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 63667EE74BBA1F0A08A698725BA31D57EF5975CA
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install openjdk-17-jre-headless ca-certificates -y
sudo apt install jenkins -y
sudo apt install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 10
sudo snap install terraform --classic
echo 'clearing screen...' && sleep 5
clear
echo 'jenkins is installed'
echo 'this is the default password :' $(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)