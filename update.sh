#!/bin/bash
cd /home/ubuntu/blitz-tactics
sudo docker-compose stop
sudo mkdir /home/ubuntu/demo3
sudo git clone https://github.com/dimapovarchuk/blitz-tactics.git /home/ubuntu/demo3
cd /home/ubuntu/demo3/
sudo docker-compose up -d