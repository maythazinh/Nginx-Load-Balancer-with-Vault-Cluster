#!/bin/bash

echo "🔐 Generating HTTPS certificate..."
./generate-cert.sh

sleep 0.5


echo "🐳 now bring up the vault server..."
docker-compose up
