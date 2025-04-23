#!/bin/sh

# Start the Vault server in the background
vault server -config=/vault/config/config.hcl &

sleep 0.5


# Check if Vault is already initialized
if vault status | grep -q 'Initialized.*true'; then
  echo "Vault is already initialized."
  
else
# Initialize Vault
  echo "Vault is not initialized. Initializing..."
  vault operator init > /unseal-script/unseal-output.txt
fi

# Unseal Vault (optional, depends on your setup)
if vault status | grep -q 'Sealed.*true'; then
vault operator unseal $(grep 'Unseal Key 1' /unseal-script/unseal-output.txt | awk '{print $4}')
vault operator unseal $(grep 'Unseal Key 2' /unseal-script/unseal-output.txt | awk '{print $4}')
vault operator unseal $(grep 'Unseal Key 3' /unseal-script/unseal-output.txt | awk '{print $4}')

vault login $(grep 'Initial Root Token' /unseal-script/unseal-output.txt | awk '{print $4}')
else
  echo "[INFO] Vault already unsealed"
fi

echo "Vault Unseal Successfully"

vault status
vault operator raft list-peers


wait
