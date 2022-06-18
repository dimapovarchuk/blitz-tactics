#!/bin/bash
cd /home/ubuntu/blitz-tactics
sudo docker-compose stop
sudo mkdir /home/ubuntu/demo3
sudo git clone https://github.com/dimapovarchuk/blitz-tactics.git /home/ubuntu/demo3
cd /home/ubuntu/demo3
sudo cp -rf * /home/ubuntu/blitz-tactics
sudo rm /home/ubuntu/blitz-tactics/Gemfile.lock
cd /home/ubuntu/blitz-tactics
sudo docker-compose up -d