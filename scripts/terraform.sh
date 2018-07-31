#!/bin/bash
if [ ! -d /home/vagrant/terraform ]; then
    mkdir terraform && cd terraform
    wget https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip
    unzip terraform_0.6.16_linux_amd64.zip
fi;
