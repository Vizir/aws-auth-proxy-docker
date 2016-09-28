#!/usr/bin/env sh

set -euo pipefail

/generate-htpasswd.sh
exec supervisord -c /etc/supervisord.conf
