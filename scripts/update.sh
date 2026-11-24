#!/usr/bin/env bash

# Get System Updates, update NPM packages and dotfiles
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

trap on_error SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v "$1" > /dev/null 2>&1
}

# Success reporter
info() {
  echo -e "${CYAN}${*}${RESET}"
}

# Error reporter
error() {
  echo -e "${RED}${*}${RESET}"
}

# Success reporter
success() {
  echo -e "${GREEN}${*}${RESET}"
}

# End section
finish() {
  success "Done!"
  echo
  sleep 1
}

# Set directory
export DOTFILES=${1:-"$HOME/.dotfiles"}

on_start() {
  info '           __        __   ____ _  __            '
  info '      ____/ /____   / /_ / __/(_)/ /___   _____ '
  info '     / __  // __ \ / __// /_ / // // _ \ / ___/ '
  info '  _ / /_/ // /_/ // /_ / __// // //  __/(__  )  '
  info ' (_)\__,_/ \____/ \__//_/  /_//_/ \___//____/   '
  info '                                                '
  info '        by @ryck, based on @denysdovhan        '
  info '                                                '
}

update_dotfiles() {
  info "Updating dotfiles..."

  cd "$DOTFILES" || exit

  # Never pull over local edits: commit them, or move machine-specific
  # settings to ~/.zshlocal, ~/.gitlocal or custom/
  if [[ -n "$(git status --porcelain --untracked-files=no)" ]]; then
    error "You have uncommitted changes in $DOTFILES:"
    git status --short --untracked-files=no
    error "Commit or stash them, then run update again."
    cd - > /dev/null 2>&1
    return
  fi

  git pull --rebase --autostash origin master
  ./install --except shell
  cd - > /dev/null 2>&1 || exit

  finish
}

update_zgenom() {
  info "Updating zgenom and Zsh plugins..."

  local zgenom_source="${HOME}/.zgenom/zgenom.zsh"

  if [[ ! -f "$zgenom_source" ]]; then
    "$DOTFILES/scripts/zgenom.sh"
  fi

  zsh -c 'source "${HOME}/.zgenom/zgenom.zsh" && zgenom selfupdate && zgenom update'

  finish
}

update_mise() {
  if ! _exists mise; then
    return
  fi

  info "Updating mise runtimes..."

  mise upgrade

  finish
}

update_brew() {
  if ! _exists brew; then
    return
  fi

  info "Updating Homebrew..."

  brew update
  brew upgrade
  brew cleanup

  finish
}

update_apt() {
  if ! _exists apt; then
    return
  fi

  info "Updating Ubuntu and installed packages..."

  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean -y

  finish
}

on_finish() {
  success "Done!"
  success "Happy Coding!"
  echo
  echo -ne "$RED"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  "$RESET""$BOLD"',------,'"$RESET"
  echo -ne "$YELLOW"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  "$RESET""$BOLD"'|   /\_/\\'"$RESET"
  echo -ne "$GREEN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e  "$RESET""$BOLD"'~|__( ^ .^)'"$RESET"
  echo -ne "$CYAN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  "$RESET""$BOLD"'""  ""'"$RESET"
  echo
}

on_error() {
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  exit 1
}

main() {
  echo "Before we proceed, please type your sudo password:"
  sudo -v

  on_start "$*"
  update_dotfiles "$*"
  update_zgenom "$*"
  update_brew "$*"
  update_mise "$*"
  update_apt "$*"
  on_finish "$*"
}

main "$*"
