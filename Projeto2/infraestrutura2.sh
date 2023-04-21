#!/bin/bash

echo "Atualizando Servidor..."
apt-get update
apt-get upgrade -y
apt-get install apache2 unzip -y

echo "Baixando os arquivos da aplicação DIO..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

echo "Copiando os arquivos da aplicação DIO..."
cd linux-site-dio-main
cp -R * /var/www/html/


