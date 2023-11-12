#!/bin/bash
echo "Script is running"


export DEBIAN_FRONTEND=noninteractive

sudo apt update
sudo apt upgrade -y

sudo apt install git -y     

sudo apt install docker.io -y

sudo apt-get install docker-compose -y


sudo systemctl start docker


sudo systemctl enable docker


docker --version
docker-compose --version

git clone "https://github.com/SarumathyPrabakaran/flask-sqlite3.git"

cd flask-sqlite3



sudo docker-compose up --build

