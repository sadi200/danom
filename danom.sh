#!/bin/bash

echo "🔄 প্যাকেজ আপডেট করা হচ্ছে এবং নির্ভরতা ইনস্টল করা হচ্ছে..."
sudo apt update && sudo apt install -y wget curl tar screen

echo "📥 DanomV4 ডাউনলোড ও এক্সট্র্যাক্ট করা হচ্ছে..."
wget https://github.com/DanomSite/release/releases/download/v4/DanomV4.tar.gz -O DanomV4.tar.gz
tar -xvzf DanomV4.tar.gz
cd Danom || { echo "❌ Danom ফোল্ডার পাওয়া যায়নি!"; exit 1; }

echo "⚙️ ইনস্টলেশন চালানো হচ্ছে..."
curl -fsSL 'https://testnet.danom.site/install.sh' | bash

read -p "🔹 ওয়ালেট ঠিকানা লিখুন (0x...): " WALLET_ADDRESS
read -p "🔹 Hugging Face API Key লিখুন: " POOL_LIST

echo "📝 কনফিগারেশন সংরক্ষণ করা হচ্ছে..."
echo "{\"wallet\": \"$WALLET_ADDRESS\", \"pool_list\": \"$POOL_LIST\"}" > wallet_config.json

echo "🚀 Danom স্ক্রিন সেশনে চালু করা হচ্ছে..."
screen -dmS danom ./danom

echo "✅ ইনস্টলেশন সম্পন্ন! নিম্নলিখিত কমান্ড ব্যবহার করে প্রক্রিয়াটি দেখুন:"
echo "   👉 screen -Rd danom"
