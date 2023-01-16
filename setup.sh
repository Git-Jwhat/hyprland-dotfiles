#!/bin/bash
yay --save --nocleanmenu --nodiffmenu --removemake -S hyprland waybar-hyprland-git hyprpaper-git bluetuith mangohud pokemon-colorscripts-git cliphist networkmanager-dmenu-git sddm-theme-aerial-git amberol

yay --save --nocleanmenu --nodiffmenu --removemake --answerclean All --answerdiff All -S xdg-desktop-portal-hyprland-git 

yay -S alacritty wofi ttf-nerd-fonts-symbols-2048-em ttf-nerd-fonts-symbols-2048-em-mono ttf-nerd-fonts-symbols-common noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra pavucontrol nnn btop playerctl yt-dlp dunst polkit polkit-gnome brightnessctl fish python-requests micro firefox libnotify alsa-utils qt5-wayland slurp

echo "Packages have been downloaded"
sudo cp -R ./.config/ ~/

echo "Configs was moved"
sudo cp -R ./etc/ /

echo "SDDM conf moved"
sudo cp -R ./Pictures/ ~/

echo "Wallpapers where moved"
sudo cp /usr/share/sddm/themes/aerial/theme.conf /usr/share/sddm/themes/aerial/theme.conf.user

echo "SDDM theme conf moved"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

echo "GTK dark mode set"
sudo chmod -R 777 ~/.config/

sudo chmod -R 777  ~/Pictures/

echo "Ownership set"
chsh -s /usr/bin/fish

echo "Fish set to default shell"
echo "Reboot or whatever now, it's all done :3"
