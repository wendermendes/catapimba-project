#!/bin/bash

#ATUALIZAÇÃO DO SO
sudo apt-get update
sudo apt-get install -y apt-utils
sudo apt-get install -y ca-certificates curl gnupg lsb-release

#PASSO A PASSO PARA INSTALAÇÃO DO DOCKER SEGUNDO DOCUMENTAÇÃO OFICIAL
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#CRIAÇÃO DOS CONTAINERS QUE VÃO RODAR AS APLICAÇÕES
docker run --name tcloud_zbx_db -e MARIADB_ROOT_PASSWORD=root_password -e MARIADB_DATABASE=zabbix_db -e MARIADB_USER=zabbix_usr -e MARIADB_PASSWORD=zabbox_pwd --volume /var/lib/mysql:/var/lib/mysql -d mariadb:10.7
docker run --name tcloud_zbx_fe --link mariadb:mariadb -p 80:80 -d truecharts/zabbix-server
docker run --name tcloud_gfn -p 3000:3000 -d grafana/grafana
