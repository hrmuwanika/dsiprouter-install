#!/bin/bash

################################################################################
# Script for installing dSIPRouter on Debian 10.0 (could be used for other version too)
# Authors: Henry Robert Muwanika
#-------------------------------------------------------------------------------
# 
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano install_dsiprouter.sh
# Place this content in it and then make the file executable:
# sudo chmod +x install_dsiprouter.sh
# Execute the script to install dsiprouter:
# ./install_dsiprouter.sh
################################################################################

#--------------------------------------------------
# Upgrade the packages
#--------------------------------------------------
echo -e "\n============== Update Server ======================="
sudo apt update && sudo apt upgrade -y

#----------------------------------------------------
# Set hostname
#----------------------------------------------------
sudo hostnamectl set-hostname sbc.example.com

#----------------------------------------------------
# Install some dependencies
#----------------------------------------------------
sudo apt install -y git curl sngrep

#----------------------------------------------------
# Install dSIPRouter
#----------------------------------------------------
cd /opt && git clone https://github.com/dOpensource/dsiprouter -b master dsiprouter
cd dsiprouter
./dsiprouter.sh install -all

#----------------------------------------------------
# Install ssl certificate
#----------------------------------------------------
certbot certonly -standalone -non-interactive -agree-tos -d example.com -m info@gmail.com

nano dsiprouter.conf

systemctl restart nginx

