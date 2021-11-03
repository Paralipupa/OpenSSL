#!/bin/bash

if [[ $# -eq 0 ]] 
then
	echo 'run: build-key.sh <filename>'
	exit 1
fi

KEY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")">/dev/null 2>&1 && pwd )"

openssl genpkey -algorithm rsa -out $KEY_DIR/$1.key
openssl req -new -sha256 -key $KEY_DIR/$1.key -out $KEY_DIR/$1.csr -subj "/C=RU/ST=CA/O=QBorder, Inc./CN=$1"
openssl x509 -days 365 -req -in $KEY_DIR/$1.csr -CA $KEY_DIR/ca.crt -CAkey $KEY_DIR/ca.key -CAcreateserial -out $KEY_DIR/$1.crt

