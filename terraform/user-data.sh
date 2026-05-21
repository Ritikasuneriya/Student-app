#!/bin/bash
sudo -i 
apt update -y

# Install Docker
apt install docker.io -y 
systemctl enable --now docker

# Add ec2-user to docker group
usermod -aG docker ubuntu

# Clone repository
cd /home/ubuntu
git clone https://github.com/Ritikasuneriya/Student-app.git

# Install docker compose 
curl -SL https://github.com/docker/compose/releases/download/v5.1.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

cd STUDENT-APP

# Run docker compose
docker compose up -d