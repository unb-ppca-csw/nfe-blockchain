#/bin/sh

#Comandos para adicionar usuário para permitir o acesso à máquina Docker via terminal Putty (SSH).
## neste caso associar na hora de realizar a inicialização das máquinas as diretivas de bind de portas: 
## [node1] -p 2222:22 
## [node2] -p 3333:22

#adduser --disabled-password --gecos "" user
#usermod -aG sudo user

cp -r etc/nfechain /etc
cp -r bin/* /usr/share/bin/
