#!/usr/bin/env sh

set -euo pipefail

for user_password in $USERS; do
  user=$(echo "$user_password" | cut -d ':' -f1)
  password=$(echo "$user_password" | cut -d ':' -f2)

  echo "$password" | htpasswd -i /etc/nginx/.htpasswd "$user"
done
