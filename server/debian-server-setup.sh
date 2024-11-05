#!/bin/bash -e

cd $HOME

sudo apt update -y
sudo apt install \
	build-essential \
	python3 \
	vim \
	ssh \
	ufw \
	curl \
	wget \
	zip \
	unzip \
	ca-certificates \
	cron \
	apt-transport-https \
	gpg \
	-y

# firewall setup
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# docker installation
if ! command -v docker &> /dev/null
then
	echo "Docker is not installed."
	sudo nstall -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
	  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

	sudo apt update -y
	sudo apt install \
		docker-ce \
		docker-ce-cli \
		containerd.io \
		docker-buildx-plugin \
		docker-compose-plugin \
		-y
	
	# sudoless docker
	sudo groupadd docker || true
	sudo usermod -aG docker $USER || true
	newgrp docker || true

else
	echo "Docker is installed."
fi

# install node
if ! command -v node &> /dev/null
then 
	sudo apt install nodejs npm
else
	echo "NodeJS is installed."
fi

# java
if ! command -v java &> /dev/null
then
	wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
	echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

	sudo apt update -y
	sudo apt install temurin-21-jdk -y
else
	echo "Java is installed."
fi

# nginx
if ! command -v nginx &> /dev/null
then
	sudo apt install nginx -y
else
	echo "Nginx is installed."
fi

# jenkins
if ! command -v jenkins &> /dev/null
then
	sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
	echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
	  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
	  /etc/apt/sources.list.d/jenkins.list > /dev/null
	sudo apt-get update -y
	sudo apt-get install jenkins -y
else
	echo "Jenkins is installed."
fi
