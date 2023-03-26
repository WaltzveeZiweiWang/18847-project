#!/bin/bash

sudo apt-get update

sudo apt-get install ca-certificates -y
sudo apt-get install curl -y
sudo apt-get install gnupg -y
sudo apt-get install lsb-release -y

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

sudo docker swarm join --token SWMTKN-1-3x46v0ggiqu4037t99adzu2cewgzeq56jk1hj6wydeshpcs32g-3mxdh32n1zai7bl80f3yhucmj 10.10.1.1:2377