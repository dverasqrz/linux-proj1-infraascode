#!/bin/bash

<<INICIO

# Clean all
echo "Removing directories...\n"
rm -rf /publico /adm /ven /sec
# Remove users
echo "Removing users...\n"
userdel -r carlos
userdel -r maria
userdel -r joao
userdel -r debora
userdel -r sebastiana
userdel -r roberto
userdel -r josefina
userdel -r amanda
userdel -r rogerio
# Remove groups
echo "Removing groups...\n"
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

INICIO

# Create directories
echo "Creating directories\n"
mkdir /publico /adm /ven /sec
# create groups
echo "Creating groups\n"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
# Create users and assign groups
echo "Creating users and assigning groups\n"
useradd carlos -s /bin/bash -d /home/carlos -c "Usuario Carlos Administrativo" -G GRP_ADM -p $(openssl passwd S3nh@!123)
useradd maria -s /bin/bash -d /home/maria -c "Usuario Maria Administrativo" -G GRP_ADM -p $(openssl passwd S3nh@!123)
useradd joao -s /bin/bash -d /home/joao -c "Usuario Joao Administrativo" -G GRP_ADM -p $(openssl passwd S3nh@!123)

useradd debora -s /bin/bash -d /home/debora -c "Usuario Debora Vendas" -G GRP_VEN -p $(openssl passwd S3nh@!123)
useradd sebastiana -s /bin/bash -d /home/sebastiana -c "Usuario Sebastiana Vendas" -G GRP_VEN -p $(openssl passwd S3nh@!123)
useradd roberto -s /bin/bash -d /home/roberto -c "Usuario Roberto Vendas" -G GRP_VEN -p $(openssl passwd S3nh@!123)

useradd josefina -s /bin/bash -d /home/josefina -c "Usuario Josefina Secretaria" -G GRP_SEC -p $(openssl passwd S3nh@!123)
useradd amanda -s /bin/bash -d /home/amanda -c "Usuario Amanda Secretaria" -G GRP_SEC -p $(openssl passwd S3nh@!123)
useradd rogerio -s /bin/bash -d /home/rogerio -c "Usuario Rogerio Secretaria" -G GRP_SEC -p $(openssl passwd S3nh@!123)

# Assign owners and permissions
echo "Assigning owners and permissions"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico
