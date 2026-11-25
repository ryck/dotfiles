#
# ~/.zshrc
#
# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Use ~/.config on macOS too (lazygit, atuin, etc.)
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  # Pure zsh: (Ie) is the exact index of $1 in $path, 0 if missing
  (( ${path[(Ie)$1]} )) || path=("$1" $path)
}

# Add custom bin to $PATH
_extend_path "$DOTFILES/bin" # custom scripts
_extend_path "$HOME/.local/bin" # local bins
_extend_path "$HOME/.npm-global/bin" # npm global packages
_extend_path "$HOME/.rvm/bin" # RVM
_extend_path "$HOME/.rd/bin" # Rancher Desktop

# Extend $NODE_PATH
if [ -d "$HOME/.npm-global" ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
fi

# Default pager
export PAGER='less'

# less options
less_opts=(
  # Quit if entire file fits on first screen.
  -FX
  # Ignore case in searches that do not contain uppercase.
  --ignore-case
  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS
  # Quiet the terminal bell. (when trying to scroll past the end of the buffer)
  --quiet
  # Do not complain when we are on a dumb terminal.
  --dumb
)
export LESS="${less_opts[*]}"

# Default editor: VS Code locally, then fresh, nano, and vim as a last resort
# (VS Code is skipped over SSH, where it can't open a window)
if [[ -z "$SSH_CONNECTION" ]] && command -v code >/dev/null 2>&1; then
  # --wait: block until the file's tab is closed (needed by git, gh, etc.)
  export EDITOR='code --wait'
elif command -v fresh >/dev/null 2>&1; then
  export EDITOR='fresh'
elif command -v nano >/dev/null 2>&1; then
  export EDITOR='nano'
elif command -v vim >/dev/null 2>&1; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi
export VISUAL="$EDITOR"

# Better formatting for time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
export ZSH_DISABLE_COMPFIX=true

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

# Regenerate the zgenom init script when these files change
# (N) keeps the glob from failing when custom/ is empty
export ZGEN_RESET_ON_CHANGE=(
  "${HOME}/.zshrc"
  "${DOTFILES}"/lib/*.zsh(N)
  "${DOTFILES}"/custom/*.zsh(N)
)

# Load zgenom (maintained fork of zgen)
# https://github.com/jandamm/zgenom
# Always use ~/.zgenom, even if an old ~/.zgen directory exists
export ZGEN_DIR="${HOME}/.zgenom/sources"
source "${HOME}/.zgenom/zgenom.zsh"

# Load zgenom init script
if ! zgenom saved; then
    echo "Creating a zgenom save"

    zgenom ohmyzsh

    # Oh-My-Zsh plugins
    zgenom ohmyzsh plugins/brew
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/tmux
    zgenom ohmyzsh plugins/history-substring-search
    zgenom ohmyzsh plugins/sudo
    zgenom ohmyzsh plugins/command-not-found
    zgenom ohmyzsh plugins/npm
    zgenom ohmyzsh plugins/extract
    zgenom ohmyzsh plugins/macos
    zgenom ohmyzsh plugins/vscode
    zgenom ohmyzsh plugins/gh
    zgenom ohmyzsh plugins/common-aliases
    zgenom ohmyzsh plugins/docker
    zgenom ohmyzsh plugins/docker-compose
    zgenom ohmyzsh plugins/tldr
    zgenom ohmyzsh plugins/fzf
    zgenom ohmyzsh plugins/uv
    zgenom ohmyzsh plugins/copypath
    zgenom ohmyzsh plugins/copyfile
    zgenom ohmyzsh plugins/copybuffer
    zgenom ohmyzsh plugins/dirhistory
    zgenom ohmyzsh plugins/mise
    zgenom ohmyzsh plugins/git-commit
    zgenom ohmyzsh plugins/magic-enter
    zgenom ohmyzsh plugins/aliases

    # Like cd but with z-zsh capabilities
    if command -v zoxide >/dev/null 2>&1; then
      zgenom ohmyzsh plugins/zoxide
    fi

    # Per-directory env vars
    if command -v direnv >/dev/null 2>&1; then
      zgenom ohmyzsh plugins/direnv
    fi

    # Custom plugins
    zgenom load tinted-theming/tinted-shell
    zgenom load MichaelAquilina/zsh-you-should-use
    zgenom load hlissner/zsh-autopair
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load Aloxaf/fzf-tab
    zgenom load ntnyq/omz-plugin-pnpm # pnpm aliases (p, pa, pr, pd…) and PNPM_HOME

    # Files
    zgenom load $DOTFILES/lib
    zgenom load $DOTFILES/custom

    # Spaceship prompt (config in config/spaceship)
    zgenom load spaceship-prompt/spaceship-prompt spaceship

    # Completions
    zgenom load zsh-users/zsh-completions src

    # Save all to init script
    zgenom save
fi

# ------------------------------------------------------------------------------
# Load additional zsh files
# ------------------------------------------------------------------------------

# Bazel environment variables
if [[ -f "$HOME/.bazelenv" ]]; then
  source "$HOME/.bazelenv"
fi

# ------------------------------------------------------------------------------
# Overrides
# ------------------------------------------------------------------------------

# Source local configuration
if [[ -f "$HOME/.zshlocal" ]]; then
  source "$HOME/.zshlocal"
fi

# ------------------------------------------------------------------------------
