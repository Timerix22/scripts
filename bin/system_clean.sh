#!/usr/bin/bash
set -x
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
    echo $'y\ny' | pacman -Scc
}

is_bin_in_path apt && clean_apt
is_bin_in_path pacman && clean_pacman

# unused locales
sudo localepurge
# logs
sudo rm -rf /var/log/*
# temp
rm -rf /tmp/*
rm -rf /var/tmp/*
# docs
sudo rm -rf /usr/share/doc
# theme files
sudo rm -rf /usr/share/wallpapers
if [ -d /usr/share/icons/breeze-dark ]; then
  sudo rm -rf /usr/share/icons/breeze-dark
  sudo ln -s  /usr/share/icons/breeze-dark /usr/share/icons/breeze
fi
if [ -d /usr/share/icons/Adwaita ]; then
  sudo rm -rf /usr/share/icons/Adwaita
  sudo ln -s  /usr/share/icons/Adwaita /usr/share/icons/breeze
fi
# headers
sudo rm -rf /usr/include/wine
sudo rm -rf /usr/include/KF5

# user files
function clean_userdir {
  local userdir="$1"
  # nuget
  rm -rf "$userdir/.nuget"
  rm -rf "$userdir/.local/share/NuGet"
  # cache
  rm -rf "$userdir/.cache"
  # VS Code cache
  rm -rf "$userdir/.config/Code/CachedExtensionVSIXs"
  rm -rf "$userdir/.config/Code/CachedData"
  rm -rf "$userdir/.config/Code/Cache"
  rm -rf "$userdir/.config/Code/logs"
  rm -rf "$userdir/.config/Code/Service Worker/CacheStorage"
  find "$userdir/.config/Code/User/workspaceStorage" -type f -name '.browse.VC.db' -delete
  # some zsh domps
  rm -f "$userdir"/.zcompdump*
}

clean_userdir /root
for user in $(ls /home); do
  clean_userdir /home/$user
done

set +x
echo -e '-------------------'
echo "you can save even more space in /var/lib/systmd/coredump by adding"
echo "Storage=none
ProcessSizeMax=0"
echo "to /etc/systemd/coredump.conf"
echo -e '-------------------'
set -x

df -h /home/
