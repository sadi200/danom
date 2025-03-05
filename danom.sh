#!/bin/bash

echo "🔄 Updating packages and installing dependencies..."
sudo apt update && sudo apt install -y wget curl tar screen

echo "📥 Downloading and extracting DanomV4..."
wget https://github.com/DanomSite/release/releases/download/v4/DanomV4.tar.gz -O DanomV4.tar.gz
tar -xvzf DanomV4.tar.gz
cd Danom || { echo "❌ Danom folder not found!"; exit 1; }

echo "⚙️ Running installation..."
curl -fsSL 'https://testnet.danom.site/install.sh' | bash

read -p "🔹 Enter wallet address (0x...): " WALLET_ADDRESS
read -p "🔹 Enter Hugging Face API Key: " POOL_LIST

echo "📝 Saving configuration..."
echo "{\"wallet\": \"$WALLET_ADDRESS\", \"pool_list\": \"$POOL_LIST\"}" > wallet_config.json

echo "🚀 Running Danom in a screen session..."
screen -dmS danom ./danom

echo "✅ Installation complete! Use the following command to view the process:"
echo "   👉 screen -Rd danom"
