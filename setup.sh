#!/bin/bash
yay --save --nocleanmenu --nodiffmenu --removemake -S hyprland waybar-hyprland-git hyprpaper-git bluetuith mangohud pokemon-colorscripts-git cliphist xdg-desktop-portal-wlr networkmanager-dmenu-git sddm-theme-aerial-git
wait
yay --save --nocleanmenu --nodiffmenu --removemake --answerclean All --answerdiff All -S xdg-desktop-portal-hyprland-git 
wait
yay -S alacritty wofi ttf-nerd-fonts-symbols-2048-em ttf-nerd-fonts-symbols-2048-em-mono ttf-nerd-fonts-symbols-common noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra pavucontrol nnn btop playerctl yt-dlp dunst polkit polkit-gnome light fish python-requests micro cmus firefox
wait
echo "Packages have been downloaded"
sudo cp -R ./.config/ ~/
wait
echo "Configs was moved"
sudo cp -R ./etc/ /
wait
echo "SDDM conf moved"
sudo cp -R ./Pictures/ ~/
wait
echo "Wallpapers where moved"
sudo cp /usr/share/sddm/themes/aerial/theme.conf /usr/share/sddm/themes/aerial/theme.conf.user
wait
echo "SDDM theme conf moved"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
wait
echo "GTK dark mode set"
sudo chmod 700 -R ~/.config/
wait
sudo chmod 700 -R ~/Pictures/
wait
echo "Ownership set"
echo "Reboot or whatever now, it's all done :3"
