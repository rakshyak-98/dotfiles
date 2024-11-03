#!/bin/bash

# Variables
GO_VERSION="1.23.2" # Update to latest stable version if needed
INSTALL_DIR="/usr/local"
PROFILE_FILE="$HOME/.profile"

# Download Go
echo "Downloading Go $GO_VERSION..."
wget -q https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz -O /tmp/go$GO_VERSION.linux-amd64.tar.gz

# Extract and install Go
echo "Installing Go to $INSTALL_DIR..."
sudo tar -C $INSTALL_DIR -xzf /tmp/go$GO_VERSION.linux-amd64.tar.gz

# Set up environment variables
echo "Configuring environment variables..."
echo "export PATH=$PATH:$INSTALL_DIR/go/bin" >> $PROFILE_FILE
echo "export GOPATH=$HOME/go" >> $PROFILE_FILE
echo "export GOROOT=$INSTALL_DIR/go" >> $PROFILE_FILE

# Apply changes
source $PROFILE_FILE

# Verify installation
go version

