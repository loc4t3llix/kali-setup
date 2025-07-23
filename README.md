# 🔧 Kali Auto-Setup Script

Script di configurazione automatica per Kali Linux in una nuova VM.

## ✨ Cosa fa questo script

✔ Aggiorna il sistema (`apt update && upgrade`)  
✔ Installa strumenti base: `zsh`, `oh-my-zsh`, `fonts-powerline`, `neofetch`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `htop`, `jq`, `net-tools`  
✔ Configura il terminale con tema figo (`agnoster`), Neofetch e plugin  
✔ Imposta `zsh` come shell predefinita  
✔ Installa e configura **ZeroTier**  
✔ Chiede il tuo **Network ID** e si connette automaticamente  
✔ Mostra stato completo della rete ZeroTier  
✔ Rimuove pacchetti inutili

## 🖥️ Come usarlo

1. Scarica e scompatta lo script:
   ```bash
   curl -LO https://your-download-link/kali-autosetup.zip
   unzip kali-autosetup.zip
   cd kali-autosetup
   chmod +x setup-kali.sh
   ./setup-kali.sh
   ```

## 🧑‍💻 Autore

Made with ❤️ by [loc4t3llix](https://github.com/loc4t3llix)
