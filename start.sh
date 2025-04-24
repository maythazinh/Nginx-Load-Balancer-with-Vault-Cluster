#!/bin/bash

### make teh script executable
chmod +x generate-cert.sh

echo "🔐 Generating HTTPS certificate..."
./generate-cert.sh

sleep 0.5


echo "🐳 now bring up the vault server..."
docker-compose up
