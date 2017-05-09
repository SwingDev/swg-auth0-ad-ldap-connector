#!/bin/bash
set -e

CONFIG_DIR="/var/lib/data/auth0-adldap"
APP_DIR="/opt/auth0-adldap"

if [ -n "$ENABLE_HEALTHCHECK" ]; then
  python healthcheck.py &
fi

SRC_KEY_FILE="${CONFIG_DIR}/certs/cert.key"
SRC_CERT_FILE="${CONFIG_DIR}/certs/cert.pem"
SRC_CONFIG_FILE="${CONFIG_DIR}/config.json"
DST_KEY_FILE="${APP_DIR}/certs/cert.key"
DST_CERT_FILE="${APP_DIR}/certs/cert.pem"
DST_CONFIG_FILE="${APP_DIR}/config.json"

if [ -f $SRC_KEY_FILE ]; then
  cp "${SRC_KEY_FILE}" "${DST_KEY_FILE}"
fi

if [ -f $SRC_CERT_FILE ]; then
  cp "${SRC_CERT_FILE}" "${DST_CERT_FILE}"
fi

if [ ! -f $SRC_CONFIG_FILE ]; then
  echo "Required config.json file not found"
  exit 1
fi
cp "${SRC_CONFIG_FILE}" "${DST_CONFIG_FILE}"

exec "$@"