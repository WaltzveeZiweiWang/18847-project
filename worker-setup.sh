#!/bin/bash

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo chmod a+r /etc/apt/keyrings/docker.gpg

sudo apt-get update

sudo apt-get install docker-ce -y
sudo apt-get install docker-ce-cli -y
sudo apt-get install containerd.io -y
sudo apt-get install docker-buildx-plugin -y 
sudo apt-get install docker-compose-plugin -y

sudo docker run hello-world

sudo apt-get update

sudo apt-get install docker-compose-plugin -y

sudo apt-get install libz-dev -y

sudo apt-get install luarocks -y

sudo luarocks install luasocket

sudo dockerd &> /dev/null &

sudo docker swarm join --token SWMTKN-1-4d3prd0sejzrohi04c8yso8dmyxozv5jcnbf8q6b3bepxohpci-bj8vboome49avrmhi1nj5maxi 128.110.216.12:2377