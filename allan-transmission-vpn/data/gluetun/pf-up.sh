#!/bin/sh
# Run by Gluetun when PIA hands out a forwarded port: make it Transmission's peer port.
# Transmission shares Gluetun's network namespace, so its RPC is on 127.0.0.1.
PORT="${1%%,*}"
URL=http://127.0.0.1:9091/transmission/rpc
case "$PORT" in ''|*[!0-9]*) echo "pf-up: bad port '$1'"; exit 1;; esac
i=0
while [ $i -lt 60 ]; do
  SID=$(wget -S -q -O /dev/null "$URL" 2>&1 | sed -n 's/.*X-Transmission-Session-Id: *//p' | tr -d '\r' | head -1)
  if [ -n "$SID" ] && wget -q -O - --header "X-Transmission-Session-Id: $SID" \
      --header "Content-Type: application/json" \
      --post-data "{\"method\":\"session-set\",\"arguments\":{\"peer-port\":$PORT,\"peer-port-random-on-start\":false,\"port-forwarding-enabled\":false}}" \
      "$URL"; then
    echo "pf-up: Transmission peer port set to $PORT"
    exit 0
  fi
  i=$((i+1)); sleep 5
done
echo "pf-up: Transmission RPC not reachable, port $PORT not applied"
exit 1
