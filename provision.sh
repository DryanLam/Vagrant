#!/bin/bash

echo "Provisioning shell"

mkdir vagrant_data

apt-get update
apt-get install -y apache2