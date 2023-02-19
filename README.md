# Scripts
There i store some useful bash scripts from all my linux machines.

## setup
```bash
git clone https://github.com/Timerix22/scripts.git
ln -s $(realpath scripts/.allrc) ~/
echo 'source ~/.allrc' >> ~/.zshrc
echo 'source ~/.allrc' >> ~/.bashrc
```

## zsh
This repo contains my oh-my-zsh config and theme.  
**Installation:**
```sh
ln -s $(realpath .zshrc) ~/
cp my-afowler.zsh-theme ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes/
```

**Plugins:**  
https://github.com/zsh-users/zsh-completions
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/zsh-users/zsh-syntax-highlighting
https://github.com/zsh-users/zsh-history-substring-search

**Installation:**
```sh
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search
```