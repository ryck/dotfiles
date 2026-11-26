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
Type "add-zsh-hook -d preexec _atuin_preexec; add-zsh-hook -d precmd _atuin_precmd; ZSH_AUTOSUGGEST_STRATEGY=(history); fc -p; clear"
Enter
Sleep 1s
Show

Type "# zoxide: jump to a folder by name"
Enter
Sleep 700ms
Type "z dotfiles"
Sleep 300ms
Enter
Sleep 1.5s

Type "# magic-enter: Enter on an empty prompt runs gst"
Enter
Sleep 700ms
Sleep 300ms
Enter
Sleep 2.5s

Ctrl+L
Type "# eza: ls with icons and git status"
Enter
Sleep 700ms
Type "ls"
Sleep 300ms
Enter
Sleep 2.5s

Ctrl+L
Type "# bat: cat with syntax highlighting"
Enter
Sleep 700ms
Type "cat config/mise/config.toml"
Sleep 300ms
Enter
Sleep 3s

Ctrl+L
Type "# eza: tree view"
Enter
Sleep 700ms
Type "lt config"
Sleep 300ms
Enter
Sleep 3s

Ctrl+L
Type "# delta: syntax-highlighted git diffs"
Enter
Sleep 700ms
Type "git show --format= 77df858 -- home/.zshrc"
Sleep 300ms
Enter
Sleep 3.5s

Ctrl+L
Type "# fast-syntax-highlighting: typos turn red"
Enter
Sleep 700ms
Type "gti"
Sleep 1s
Backspace 3
Type "git status"
Sleep 1s
Ctrl+U

Type "# autopair: closes quotes and brackets"
Enter
Sleep 700ms
Type `echo "hello (world`
Sleep 1.5s
Ctrl+U

Type "# smartdots: dots expand as you type"
Enter
Sleep 700ms
Type "cd ...."
Sleep 1.5s
Ctrl+U

Type "# sudo: Esc Esc adds sudo"
Enter
Sleep 700ms
Type "brew services list"
Sleep 500ms
Escape
Escape
Sleep 1.5s
Ctrl+U

Ctrl+L
Type "# aliases: search your aliases"
Enter
Sleep 700ms
Type "als stash"
Sleep 300ms
Enter
Sleep 3s

Ctrl+L
Type "# autosuggestions: press the right arrow to accept"
Enter
Sleep 700ms
Type "cat c"
Sleep 1.2s
Right
Sleep 1.2s
Ctrl+U

Type "# spaceship: exit code and time taken"
Enter
Sleep 700ms
Type "sleep 2 && false"
Sleep 300ms
Enter
Sleep 3.5s

Ctrl+L
Type "# lazygit"
Enter
Sleep 700ms
Type "lg"
Sleep 300ms
Enter
Sleep 2s
Enter
Sleep 2.5s
Type "q"
Sleep 1s
