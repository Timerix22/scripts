#!/usr/bin/bash
df -h /home
# apt cache
sudo apt clean
dpkg --list |grep "^rc" | cut -d " " -f 3 | xargs sudo dpkg --purge
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
