#!/usr/bin/bash
df -h /home

function is_bin_in_path {
  if [[ -n $ZSH_VERSION ]]; then
    builtin whence -p "$1" &> /dev/null
  else  # bash:
    builtin type -P "$1" &> /dev/null
  fi
}

function clean_apt {
    echo "cleaning apt cache"
    sudo apt autoremove
    sudo apt clean
    dpkg --list |grep "^rc" | cut -d " " -f 3 | xargs sudo dpkg --purge
}

function clean_pacman {
    echo "cleaning pacman cache"
    pacman_autoremove
    pacman -Sc
    #pacman -Scc
}

is_bin_in_path apt && clean_apt
is_bin_in_path pacman && clean_pacman

# logs
sudo rm -rf /var/logs/*
# temp
rm -rf /tmp/*
# nuget
rm -rf ~/.nuget
rm -rf ~/.local/share/NuGet
# unused locales
sudo localepurge
df -h /home
