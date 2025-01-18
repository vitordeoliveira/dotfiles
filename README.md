# dotfiles

## the readme is more to me than you thief...

cp * ~/.config/

git submodule update --init --recursive

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

INSIDE TMUX
prefix + I (capslook i)

sudo pacman -S - < arch_deps.txt
paru -S - < aur_deps.txt

pacman -Qqen > arch_deps.txt
paru -Qmq > aur_deps.txt

ln -s ~/dotfiles/nvim/ ~/.config/

rm -rf ~/.config/hypr/ && ln -sf ~/dotfiles/hypr/ ~/.config/

ln -sf ~/dotfiles/waybar/ ~/.config/

ln -sf ~/dotfiles/lazygit/ ~/.config/
