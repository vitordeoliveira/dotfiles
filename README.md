# dotfiles

## the readme is more to me than you thief

cp \* ~/.config/

git submodule update --init --recursive

git clone <https://github.com/tmux-plugins/tpm> ~/.tmux/plugins/tpm

INSIDE TMUX
prefix + I (capslook i)

sudo pacman -S - < arch_deps.txt
paru -S - < aur_deps.txt

pacman -Qqen > arch_deps.txt
paru -Qmq > aur_deps.txt

ln -s ~/dotfiles/nvim/ ~/.config/

ln -s ~/dotfiles/tmux/ ~/.config/

rm -rf ~/.config/hypr/ && ln -sf ~/dotfiles/hypr/ ~/.config/

ln -sf ~/dotfiles/waybar/ ~/.config/

ln -sf ~/dotfiles/lazygit/ ~/.config/

ln -sf ~/dotfiles/wlogout/ ~/.config/

ln -sf ~/dotfiles/gtk-3.0/ ~/.config/

ln -sf ~/dotfiles/alacritty/ ~/.config/

ln -sf ~/dotfiles/starship/ ~/.config/

ln -sf ~/dotfiles/sh/aliases ~/.aliases

ln -sf ~/dotfiles/sh/others ~/.others

ln -sf ~/dotfiles/sh/custom_exports ~/.custom_exports

ln -sf ~/dotfiles/tool-versions ~/.tool-versions

sudo chmod +x ~/dotfiles/bin/_
sudo ln -sf ~/dotfiles/bin/_ /usr/bin/

sudo ln -sf ~/dotfiles/icons/\* /usr/share/pixmaps/

### enable .desktop files in the system

sudo ln -sf ~/dotfiles/apps/\* /usr/share/applications/

## to make UHK agent work

```bash
sudo -s

cp ~/dotfiles/config/50-uhk60.rules /etc/udev/rules.d
udevadm control --reload-rules
udevadm trigger
udevadm settle
```

```

```
