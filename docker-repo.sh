#!/bin/bash
sudo apt-get update
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common curl software-properties-common python-pip python-dev
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add --
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo pip install docker-py
