#!/bin/bash

echo "Provisioning shell"

# Install apaches service
apt-get update
apt-get install -y apache2
