# Records the README demo. Regenerate with:
#   vhs assets/demo.tape
# Needs vhs (brew install vhs). Run it from the repo root with a clean tree.

Output assets/demo.gif

Set Shell zsh
Set FontFamily "FiraCode Nerd Font Mono"
Set FontSize 18
Set Width 1200
Set Height 680
Set Padding 24
Set Theme "ayu"
Set TypingSpeed 45ms
Set WindowBar Colorful

# VHS starts zsh without rc files, so exec a real login shell first.
# Then keep real history out of the demo: unhook atuin (no suggestions from
# it, nothing recorded) and start an empty in-memory zsh history.
Hide
Type "cd ~ && exec zsh -l"
Enter
Sleep 3s
Type "add-zsh-hook -d preexec _atuin_preexec; add-zsh-hook -d precmd _atuin_precmd; ZSH_AUTOSUGGEST_STRATEGY=(history completion); fc -p; clear"
Enter
Sleep 1s
Show

Type "# zoxide: jump to a folder by name"
Enter
Type "z dotfiles"
Sleep 300ms
Enter
Sleep 1.5s

Type "# magic-enter: Enter on an empty prompt runs gst"
Enter
Sleep 300ms
Enter
Sleep 2.5s

Ctrl+L
Type "# eza: ls with icons and git status"
Enter
Type "ls"
Sleep 300ms
Enter
Sleep 2.5s

Ctrl+L
Type "# bat: cat with syntax highlighting"
Enter
Type "cat config/mise/config.toml"
Sleep 300ms
Enter
Sleep 3s

Ctrl+L
Type "# eza: tree view"
Enter
Type "lt config"
Sleep 300ms
Enter
Sleep 3s

Ctrl+L
Type "# delta: syntax-highlighted git diffs"
Enter
Type "git show --format= 77df858 -- home/.zshrc"
Sleep 300ms
Enter
Sleep 3.5s

Ctrl+L
Type "# fast-syntax-highlighting: typos turn red"
Enter
Type "gti"
Sleep 1s
Backspace 3
Type "git status"
Sleep 1s
Ctrl+U

Type "# autopair: closes quotes and brackets"
Enter
Type `echo "hello (world`
Sleep 1.5s
Ctrl+U

Type "# smartdots: dots expand as you type"
Enter
Type "cd ...."
Sleep 1.5s
Ctrl+U

Type "# sudo: Esc Esc adds sudo"
Enter
Type "brew services list"
Sleep 500ms
Escape
Escape
Sleep 1.5s
Ctrl+U

Ctrl+L
Type "# aliases: search your aliases"
Enter
Type "als stash"
Sleep 300ms
Enter
Sleep 3s

Ctrl+L
Type "# autosuggestions: press → to accept"
Enter
Type "cat c"
Sleep 1.2s
Right
Sleep 1.2s
Ctrl+U

Type "# spaceship: exit code and time taken"
Enter
Type "sleep 2 && false"
Sleep 300ms
Enter
Sleep 3.5s

Ctrl+L
Type "# lazygit"
Enter
Type "lg"
Sleep 300ms
Enter
Sleep 2s
Enter
Sleep 2.5s
Type "q"
Sleep 1s
