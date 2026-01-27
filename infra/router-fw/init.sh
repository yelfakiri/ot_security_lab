#!/bin/sh
set -eu

# Tools
apk add --no-cache iptables iproute2 >/dev/null

echo "[router-fw] Enabling minimal firewall (default DROP)..."

# Flush
iptables -F
iptables -t nat -F
iptables -X

# Policies
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Allow established/related traffic (retours de connexions autorisées)
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

echo "[router-fw] Firewall applied: FORWARD=DROP (no inter-zone traffic allowed yet)."

# Keep container running
tail -f /dev/null
