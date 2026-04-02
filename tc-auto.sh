#! /run/current-system/sw/bin/bash

INTERFACE=$(iw dev | awk '$1=="Interface"{print $2; exit}')

# Get current Wi-Fi link speed in Mbit/s
LINK_SPEED=$(iw dev $INTERFACE link | grep txrate | awk '{print $2}')

# If unable to detect, fallback to 25 Mbit
[[ -z "$LINK_SPEED" ]] && LINK_SPEED=25

echo "Setting up TC for $INTERFACE with max speed $LINK_SPEED Mbit/s"

# Remove old rules
tc qdisc del dev $INTERFACE root 2>/dev/null

# Root HTB qdisc
tc qdisc add dev $INTERFACE root handle 1: htb default 30

# Parent class: max bandwidth
tc class add dev $INTERFACE parent 1: classid 1:1 htb rate ${LINK_SPEED}mbit ceil ${LINK_SPEED}mbit

# High priority class: Steam + web (80% of total)
HIGH_RATE=$((LINK_SPEED * 80 / 100))
tc class add dev $INTERFACE parent 1:1 classid 1:10 htb rate ${HIGH_RATE}mbit ceil ${LINK_SPEED}mbit

# Low priority class: everything else
LOW_RATE=$((LINK_SPEED - HIGH_RATE))
tc class add dev $INTERFACE parent 1:1 classid 1:20 htb rate ${LOW_RATE}mbit ceil ${LINK_SPEED}mbit

# Mark Steam and web traffic
iptables -t mangle -F
iptables -t mangle -A OUTPUT -p tcp --dport 27015:27050 -j MARK --set-mark 10
iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 10
iptables -t mangle -A OUTPUT -p tcp --dport 443 -j MARK --set-mark 10

# Apply marks to high priority class
tc filter add dev $INTERFACE parent 1: protocol ip handle 10 fw flowid 1:10

echo "Traffic shaping applied successfully."
