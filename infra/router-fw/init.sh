#!/bin/sh
set -eu

# Tools
apk add --no-cache iptables iproute2 >/dev/nullll # Install firewall and routing utilities

echo "[router-fw] Enabling minimal firewall (default DROP)..." # Startup log message

# Flush (Reset existing firewall rules)
iptables -F #Flush filter table rules
iptables -t nat -F #Flush NAT table rules
iptables -X #Delete custom chains

# Policies (Set default firewall policies)
iptables -P INPUT ACCEPT #Allow traffic to the firewall itself
iptables -P OUTPUT ACCEPT #Allow traffic from the firewall
iptables -P FORWARD DROP #Block all inter-zone traffic by default

# Allow established/related traffic
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -s 172.20.30.10 -d 172.20.10.10 -p tcp --dport 502 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

echo "[router-fw] Firewall applied: FORWARD=DROP (no inter-zone traffic allowed yet)."

# Keep container running
tail -f /dev/null
