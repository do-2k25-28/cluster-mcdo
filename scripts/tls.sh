#!/bin/bash -e

CERT="$1"
KEY="$2"
NAMESPACES=("kube-system" "monitoring" "messagerie")
SECRET_NAME="cloudflare-origin-cert"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <cert-file> <key-file>"
  exit 1
fi

echo "Creating secret '$SECRET_NAME' in ${#NAMESPACES[@]} namespace(s)..."

for NAMESPACE in "${NAMESPACES[@]}"; do
  echo "  → $NAMESPACE"
  kubectl create secret tls "$SECRET_NAME" \
    --cert="$CERT" \
    --key="$KEY" \
    -n "$NAMESPACE"
done

echo "✓ Secret created successfully in all namespaces"
