#!/bin/bash


#Installing Node version 18.6.0

curl -O https://nodejs.org/dist/v20.18.0/node-v20.18.0-linux-x64.tar.xz
tar -xf node-v20.18.0-linux-x64.tar.xz

sudo mv node-v20.18.0-linux-x64 /usr/local/node-v20.18.0

sudo ln -s /usr/local/node-v20.18.0/bin/node /usr/bin/node
sudo ln -s /usr/local/node-v20.18.0/bin/npm /usr/bin/npm

npm install -g yarn

sudo echo "export PATH="$PATH:/usr/local/node-v20.18.0/bin"" >> ~/.bashrc


source ~/.bashrc
