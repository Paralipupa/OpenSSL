#!/bin/bash

KEY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")">/dev/null 2>&1 && pwd )"
openssl req -x509 -new -nodes -days 3650 -keyout $KEY_DIR/ca.key -out $KEY_DIR/ca.crt -subj "/C=RU/ST=CA/O=QB, Inc./CN=$1"
