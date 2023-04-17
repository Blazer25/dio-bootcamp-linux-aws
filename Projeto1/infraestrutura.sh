#!/bin/bash

echo "Iniciando execução de script de infraestrutura: "

echo "Criando diretórios..."
mkdir /publico
mkdir /administracao
mkdir /vendas
mkdir /secretariado

echo "Criando grupos..."
groupadd GRUPO_ADMINISTRACAO
groupadd GRUPO_VENDAS
groupadd GRUPO_SECRETARIADO

echo "Criando usuários..."
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_ADMINISTRACAO
useradd joana.ana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_ADMINISTRACAO
useradd jhon -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_ADMINISTRACAO

useradd mariana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_VENDAS
useradd doe.jhon -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_VENDAS
useradd alberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_VENDAS

useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_SECRETARIADO
useradd amanda.silva -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_SECRETARIADO
useradd carlos.coelho -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRUPO_SECRETARIADO

echo "Aplicando configuração para que cada usuário criado pelo script, preciso, ao logar, definir uma nova senha..."
# Usuário do grupo de administração
passwd carlos -e
passwd joana.ana -e
passwd jhon -e
# Usuário do grupo de vendas
passwd mariana -e
passwd doe.jhon -e
passwd alberto -e
# Usuário do grupo de secretariado
passwd roberto -e
passwd amanda.silva -e
passwd carlos.coelho -e

echo "Aplicando grupo para cada diretório..."
chown root:GRUPO_ADMINISTRACAO /administracao
chown root:GRUPO_VENDAS /vendas
chown root:GRUPO_SECRETARIADO /secretariado

echo "Aplicando permissões de usuários para seus rescpectivos diretórios..."
chmod 770 /administracao
chmod 770 /vendas
chmod 770 /secretariado
chmod 777 /publico

echo("Finalizando execução do script de infraestrutura.")