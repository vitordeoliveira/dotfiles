# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for an Arch Linux system running Hyprland (Wayland compositor). The repository manages configuration files for terminal, window manager, status bar, editor, and various development tools.

## Repository Structure

The dotfiles are organized by application/tool at the root level:
- `alacritty/` - Terminal emulator configuration
- `hypr/` - Hyprland window manager configuration (hyprland.conf, hyprpaper.conf, hypridle.conf, hyprlock.conf)
- `waybar/` - Status bar configuration and scripts
- `nvim/` - Neovim configuration (LazyVim-based)
- `tmux/` - Terminal multiplexer configuration
- `rofi/` - Application launcher configuration
- `sh/` - Shell configuration files (aliases, custom_exports, others)
- `scripts/` - Utility scripts
- `wallpapers/` - Wallpaper files
- `apps/` - Desktop application entries (split into `local/` and `system/`)
- `bin/` - Custom executables
- `services/` - Systemd user services
- Other directories: `lazygit/`, `starship/`, `swaylock/`, `wlogout/`, `sddm/`, `gtk-3.0/`, `icons/`, `config/`

## Dependency Management

The repository tracks system dependencies in two files:
- `arch_deps.txt` - Official Arch Linux packages (installed via pacman)
- `aur_deps.txt` - AUR packages (installed via paru)

To update these dependency files:
```bash
dub  # Alias that runs: pacman -Qqen > ~/dotfiles/arch_deps.txt && paru -Qqm > ~/dotfiles/aur_deps.txt
```

To install dependencies:
```bash
sudo pacman -S - < arch_deps.txt
paru -S - < aur_deps.txt
```

## Version Manager

This repository uses `asdf` for managing development tool versions. Active versions are tracked in `tool-versions`:
- rust 1.91.1
- nodejs 23.6.1
- lazydocker 0.24.1
- awscli 2.27.20
- maven 3.9.9
- python 3.13.3

## Symlinking Configuration

Configurations are deployed by symlinking from the dotfiles directory to their expected locations. Key symlinks from the README:

```bash
# Configuration directories
ln -s ~/dotfiles/nvim/ ~/.config/
ln -s ~/dotfiles/tmux/ ~/.config/
rm -rf ~/.config/hypr/ && ln -sf ~/dotfiles/hypr/ ~/.config/
ln -sf ~/dotfiles/waybar/ ~/.config/
ln -sf ~/dotfiles/scripts/ ~/.config/
ln -sf ~/dotfiles/lazygit/ ~/.config/
ln -sf ~/dotfiles/wlogout/ ~/.config/
ln -sf ~/dotfiles/gtk-3.0/ ~/.config/
ln -sf ~/dotfiles/alacritty/ ~/.config/
ln -sf ~/dotfiles/starship/ ~/.config/
ln -sf ~/dotfiles/wallpapers/ ~/.config/

# Shell configuration files
ln -sf ~/dotfiles/sh/aliases ~/.aliases
ln -sf ~/dotfiles/sh/others ~/.others
ln -sf ~/dotfiles/sh/custom_exports ~/.custom_exports
ln -sf ~/dotfiles/tool-versions ~/.tool-versions

# Binary and system files
sudo chmod +x ~/dotfiles/bin/*
sudo ln -sf ~/dotfiles/bin/* /usr/bin/

# Icons
sudo ln -sf ~/dotfiles/icons/* /usr/share/pixmaps/

# Desktop entries
sudo ln -sf ~/dotfiles/apps/system* /usr/share/applications/
mkdir -p ~/.local/share/applications/dotfilesapps && ln -sf ~/dotfiles/apps/local/* ~/.local/share/applications/dotfilesapps/
```

## Key Configuration Details

### Shell Environment
- Shell aliases are defined in `sh/aliases`
- Custom exports in `sh/custom_exports` (includes asdf setup, theme variables, AWS profile, Solana path)
- Uses Starship prompt (configuration in `starship/`)

### Hyprland Setup
- Main config: `hypr/hyprland.conf`
- Sources theme from `~/.config/hypr/mocha.conf`
- Terminal: Alacritty
- File manager: Dolphin
- Application launcher: Rofi (Wayland fork: rofi-lbonn-wayland-git)
- Autostart services: nm-applet, hypridle, waybar, hyprpaper, hyprpolkitagent, hyprsunset, cliphist

### Neovim
- Based on LazyVim distribution
- Entry point: `nvim/init.lua` which loads `config.lazy`
- Plugin lock file: `lazy-lock.json`

### Tmux
- Uses TPM (Tmux Plugin Manager)
- Install plugins with: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- Inside tmux, use `prefix + I` to install plugins

## Git Submodules

The repository uses git submodules. Initialize with:
```bash
git submodule update --init --recursive
```

## Special Hardware Configuration

For UHK (Ultimate Hacking Keyboard) support:
```bash
sudo cp ~/dotfiles/config/50-uhk60.rules /etc/udev/rules.d
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo udevadm settle
```

## Common Aliases

From `sh/aliases`:
- `vim=nvim` - Use Neovim for vim
- `hyprc` - Edit Hyprland config: `nvim ~/.config/hypr/hyprland.conf`
- `dub` - Update dependency files (see Dependency Management above)
- `inv` - Navigate to work project: `cd ~/Work/invisible-matrix-workspace/invisiblematrix/`

## Working with This Repository

When modifying configurations:
1. Edit files directly in `~/dotfiles/` (they're symlinked to their active locations)
2. Test changes immediately (they take effect in the symlinked locations)
3. Commit changes to git
4. When adding new system packages, update `arch_deps.txt` or `aur_deps.txt` using the `dub` alias
5. When changing tool versions, update `tool-versions` and run `asdf install`

Note: The current working directory when Claude Code starts is `~/dotfiles/alacritty/`, but the repository root is `~/dotfiles/`.
