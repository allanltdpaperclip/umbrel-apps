#!/bin/sh
# At Transmission start, use the port Gluetun last got from PIA (Gluetun also pushes it live via RPC).
P=$(head -1 /pf/forwarded_port 2>/dev/null | cut -d, -f1)
case "$P" in ''|*[!0-9]*) echo "pf-port: no forwarded port yet"; exit 0;; esac
sed -i -E "s/\"peer-port\": *[0-9]+/\"peer-port\": $P/" /config/settings.json && echo "pf-port: peer-port $P"
