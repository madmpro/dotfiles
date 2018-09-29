#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Social Media & Communication\n\n"

brew_install "WhatsApp" "whatsapp" "caskroom/cask" "cask"

brew_install "Skype" "skype" "caskroom/cask" "cask"

brew_install "Skype for Bussiness" "skype-for-business" "caskroom/cask" "cask"

brew_install "Viber" "viber" "caskroom/cask" "cask"

brew_install "Telegram Desktop" "telegram-desktop" "caskroom/cask" "cask"
