#!/usr/bin/env bash

# Script para exibir layout de teclado atual no Waybar
# Compatível com Hyprland (usa hyprctl -j e jq)

# Mapa de layouts → bandeira + label
declare -A LAYOUTS=(
  ["Portuguese (Brazil)"]="🇧🇷 BR"
  ["English (US)"]="🇺🇸 US"
  # ["Spanish (Latin American)"]="🇪🇸 ES"
  ["French (France)"]="🇫🇷 FR"
)

current_layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

if [[ -z "$current_layout" || "$current_layout" == "null" ]]; then
  echo "⌨️ N/A"
  exit 0
fi

if [[ -n "${LAYOUTS[$current_layout]}" ]]; then
  echo "${LAYOUTS[$current_layout]}"
else
  echo "⌨️ $current_layout"
fi
