# Records the README demo. Regenerate with:
#   vhs assets/demo.tape
# Needs vhs (brew install vhs). Run it from the repo root.

Output assets/demo.gif

Set Shell zsh
Set FontFamily "FiraCode Nerd Font Mono"
Set FontSize 18
Set Width 1200
Set Height 640
Set Padding 24
Set Theme "ayu"
Set TypingSpeed 60ms
Set WindowBar Colorful

# Start in the repo with an empty, throwaway history so autosuggestions
# only suggest what this demo typed.
# VHS starts zsh without rc files, so exec a real login shell first.
Hide
Type "cd ~/.dotfiles && exec zsh -l"
Enter
Sleep 3s
Type "fc -p && clear"
Enter
Sleep 1s
Show

# eza with icons and git status
Type "ls"
Sleep 400ms
Enter
Sleep 2s

# bat with syntax highlighting
Type "cat config/mise/config.toml"
Sleep 400ms
Enter
Sleep 2.5s

Type "clear"
Enter
Sleep 300ms

# eza tree view
Type "lt config"
Sleep 400ms
Enter
Sleep 2.5s

# delta-powered git log
Type "git log --oneline -6"
Sleep 400ms
Enter
Sleep 2.5s

Type "clear"
Enter
Sleep 300ms

# zsh-autosuggestions: grey suggestion from history, accept with →
Type "git l"
Sleep 1.2s
Right
Sleep 800ms
Enter
Sleep 2.5s

# Spaceship: exit code of a failed command, and time taken on the right
Type "sleep 2 && false"
Sleep 400ms
Enter
Sleep 4s
