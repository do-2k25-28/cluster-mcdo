#!/bin/bash -e

CERT="$1"
KEY="$2"
NAMESPACE="kube-system"
SECRET_NAME="cloudflare-origin-cert"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <cert-file> <key-file> [namespace]"
  exit 1
fi

kubectl create secret tls "$SECRET_NAME" \
  --cert="$CERT" \
  --key="$KEY" \
  -n "$NAMESPACE"

echo "TLS secret '$SECRET_NAME' created in namespace '$NAMESPACE'. Mission accomplished."