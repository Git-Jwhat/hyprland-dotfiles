#!/bin/bash
yay --save --nocleanmenu --nodiffmenu --removemake -S hyprland waybar-hyprland-git hyprpaper-git bluetuith mangohud pokemon-colorscripts-git cliphist networkmanager-dmenu-git sddm-theme-aerial-git amberol

yay --save --nocleanmenu --nodiffmenu --removemake --answerclean All --answerdiff All -S xdg-desktop-portal-hyprland-git 

yay -S alacritty wofi ttf-nerd-fonts-symbols-2048-em ttf-nerd-fonts-symbols-2048-em-mono ttf-nerd-fonts-symbols-common noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra pavucontrol nnn btop playerctl yt-dlp dunst polkit polkit-gnome brightnessctl fish python-requests micro firefox libnotify alsa-utils qt5-wayland slurp adwaita-qt5 adwaita-qt6 qt5ct qt6ct
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

sudo mkdir ~/.local/share/icons
sudo tar xvf BreezeX-Black.tar.gz -C ~/.local/share/icons
echo "Cursor icon extracted"

sudo mkdir ~/.icons
sudo mkdir ~/.icons/default/
sudo cp ./.icons/default/index.theme ~/.icons/default/
gsettings set org.gnome.desktop.interface cursor-theme BreezeX-Black
echo "Cursor theme set"
sudo sed -i '5i QT_QPA_PLATFORMTHEME=qt5ct' /etc/environment
sudo rm /usr/share/applications/qt5ct.desktop
sudo rm /usr/share/applications/qt6ct.desktop
echo "Reboot or whatever now, it's all done :3"
