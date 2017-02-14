#!/bin/sh

set -xeuo pipefail

exec aws-auth-proxy \
  -access-key="$AWS_ACCESS_KEY_ID" \
  -secret-key="$AWS_SECRET_ACCESS_KEY" \
  -listen-address=":3000" \
  -region-name="$AWS_REGION" \
  -service-name="$SERVICE_NAME" \
  -upstream-host="$ES_HOST" \
  -upstream-scheme="$ES_SCHEME"
