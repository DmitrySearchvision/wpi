#!/bin/bash

storage_path="../../storage"

if [ ! -f "$storage_path/salts.txt" ]; then
    curl -s https://api.wordpress.org/secret-key/1.1/salt/ > "$storage_path/salts.txt"
fi

params=("AUTH_KEY" "SECURE_AUTH_KEY" "LOGGED_IN_KEY" "NONCE_KEY" "AUTH_SALT" "SECURE_AUTH_SALT" "LOGGED_IN_SALT" "NONCE_SALT")
for param in "${params[@]}"
do
  value=$(cat $storage_path/salts.txt |grep -w "$param" | cut -d \' -f 4)
  if [ ! -z "$value" ]
  then
    value_escaped=$(sed 's/[&/\]/\\&/g' <<<"$value")
    sed -i "s/^$param=\".*\"$/$param=\"$value_escaped\"/g" .env
  fi
done
