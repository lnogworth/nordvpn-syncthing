#!/bin/sh

# Start NordVPN service
service nordvpnd start

# Log in to NordVPN
nordvpn login --username ${NORDVPN_USERNAME} --password ${NORDVPN_PASSWORD}

# Connect to NordVPN
nordvpn connect

# Start Syncthing
#syncthing -gui-address="0.0.0.0:8384"
