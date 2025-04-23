#!/bin/bash

# Define paths
mkdir -p ./load-balancer/certs

# Generate SSL cert and key
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ./load-balancer/certs/vault.key \
  -out ./load-balancer/certs/vault.crt \
  -subj "/C=JP/ST=Tokyo/L=Tokyo/O=VaultTest/CN=localhost"

###  permission to read your vault.key
chmod 644 ./load-balancer/certs/vault.*


###  Make the script executable
# chmod +x generate-cert.sh


# echo "🔐 Generating HTTPS certificate..."
# ./generate-cert.sh




# chmod +x start.sh
# ./start.sh
