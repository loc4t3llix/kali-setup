# 🔧 Kali Auto-Setup Script

Script di configurazione automatica per Kali Linux in una nuova VM.

## ⚡ Esecuzione rapida (senza git)

Puoi eseguire tutto con **una sola riga** direttamente nel terminale:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/loc4t3llix/kali-setup/main/setup-kali.sh)
```

## ✨ Cosa fa questo script

✔ Aggiorna il sistema (`apt update && upgrade`)  
✔ Installa strumenti base: `zsh`, `oh-my-zsh`, `fonts-powerline`, `neofetch`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `htop`, `jq`, `net-tools`  
✔ Configura il terminale con tema figo (`agnoster`), Neofetch e plugin  
✔ Imposta `zsh` come shell predefinita  
✔ Installa e configura **ZeroTier**  
✔ Ti chiede il tuo **Network ID** e si connette automaticamente  
✔ Mostra stato completo della rete ZeroTier  
✔ Rimuove pacchetti inutili

## 🧑‍💻 Autore

Made with ❤️ by [loc4t3llix](https://github.com/loc4t3llix)
