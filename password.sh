#!/bin/bash

# Script to read username and password silently

# Read username (normal mode)
read -p "Enter username: " username

# Read password (silent mode - input won't be visible)
read -s -p "Enter password: " password

echo ""
echo "Username: $username"
echo "Password: $password"
