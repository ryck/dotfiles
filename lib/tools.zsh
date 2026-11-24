# CLI Enhancements

# Use tldr as help util
if _exists tldr; then
  alias help="tldr"
fi

# cd with zsh-z capabilities
# https://github.com/ajeetdsouza/zoxide
if _exists zoxide; then
  alias cd='z'
fi

# Better ls with icons, tree view and more
# https://github.com/eza-community/eza
if _exists eza; then
  unalias ls 2>/dev/null
  alias ls='eza --icons --header --git --hyperlink'
  alias lt='eza --icons --tree'
  unalias l 2>/dev/null
  alias l='ls -l'
  alias la='ls -lAh'
fi

# cat with syntax highlighting
# https://github.com/sharkdp/bat
if _exists bat; then
  # Run to list all themes:
  #   bat --list-themes
  export BAT_THEME='base16'
  export BAT_STYLE='full'
  export MANPAGER='bat -plman'
  alias cat='bat'
fi

# Lazygit
# https://github.com/jesseduffield/lazygit
if _exists lazygit; then
  alias lg='lazygit'
fi

# Glow
# https://github.com/charmbracelet/glow
if _exists glow; then
  alias md='glow -t'
fi

# Claude Code
# https://claude.ai/code
if _exists claude; then
  alias cc='claude'
  alias ccx='cd ~/Projects/Playground && claude --permission-mode auto'
fi

# Codex
# https://github.com/openai/codex
if _exists codex; then
  alias cx='codex'
  alias cxx='codex --cd ~/Projects/Playground --full-auto'
fi

# Atuin: searchable, synced shell history on Ctrl-R
# Up arrow stays with zsh-history-substring-search
# https://github.com/atuinsh/atuin
if _exists atuin; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# Better top
# https://github.com/aristocratos/btop
if _exists btop; then
  alias top='btop'
fi
