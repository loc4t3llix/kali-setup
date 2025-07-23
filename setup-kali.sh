#!/bin/bash
set -e

echo "🔐 Inserisci il tuo ZeroTier Network ID:"
read -rp "Network ID: " ZTZ_NETWORK_ID

echo "⚙️  Aggiornamento del sistema..."
sudo apt update && sudo apt upgrade -y

echo "🧪 Installazione strumenti base..."
sudo apt install -y zsh git curl wget fonts-powerline neofetch zsh-syntax-highlighting zsh-autosuggestions jq net-tools htop unzip

echo "🛠 Installazione Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🎨 Configurazione del tema 'agnoster' e plugin..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
grep -qxF 'neofetch' ~/.zshrc || echo "neofetch" >> ~/.zshrc
chsh -s "$(which zsh)" || true

echo "📦 Installazione ZeroTier..."
curl -s https://install.zerotier.com | sudo bash

echo "🔌 Avvio e join alla rete ZeroTier..."
sudo systemctl enable --now zerotier-one
sleep 5
sudo zerotier-cli join "$ZTZ_NETWORK_ID"

echo "⏳ Attendo join alla rete (max 30s)..."
timeout=30
while [ $timeout -gt 0 ]; do
  status=$(zerotier-cli listnetworks | grep "$ZTZ_NETWORK_ID" | awk '{print $3}')
  if [[ "$status" == "OK" || "$status" == "ACCESS_DENIED" ]]; then
    echo "📶 Stato rete: $status"
    break
  fi
  sleep 1
  ((timeout--))
done

if [ $timeout -le 0 ]; then
  echo "⚠️ Timeout: verifica manuale dello status con 'zerotier-cli listnetworks'."
fi

echo -e "\n📋 Stato ZeroTier:"
zerotier-cli info
zerotier-cli listnetworks

echo "🧼 Pulizia pacchetti inutili..."
sudo apt autoremove -y

echo -e "\n✅ Setup completato! Chiudi e riapri il terminale per vedere il nuovo prompt."
