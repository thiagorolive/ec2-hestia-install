#!/bin/bash
#atualização e instalação de ferramentas
apt-get update
apt-get upgrade -y
#instalação do docker

# sudo apt-get install \
#     ca-certificates \
#     curl \
#     gnupg \
#     lsb-release
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
# apt-cache madison docker-ce
# sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin -y
# #criação do container apache
# docker container run -dit --name my-apache-app -p 80:80 -v /var/www/html:/usr/local/apache2/htdocs/ httpd:alpine
# apt install unzip -y
# #baixando conteudo a ser exibido no servidor web
# cd /var/www/html
# wget eletrotecguara.com.br/archive.zip
# unzip archive.zip
# cd web/eletrotecguara.com.br/public_html
# cp -r . /var/www/html
# rm -R /var/www/html/web