# Records the README demo (demo.gif) plus demo.mp4. Regenerate with:
#   vhs assets/demo.tape
# Needs vhs (brew install vhs). Run it from the repo root with a clean tree.

Output assets/demo.gif
Output assets/demo.mp4

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
# Throwaway projects for the runtime-version demo
Type@1ms "export _ZO_EXCLUDE_DIRS='/tmp/*:/private/tmp/*'; rm -rf /tmp/demo; mkdir -p /tmp/demo/{legacy-app,new-app,api,ml}; echo 22 > /tmp/demo/legacy-app/.nvmrc; echo '{}' | tee /tmp/demo/{legacy-app,new-app}/package.json >/dev/null; echo 'module api' > /tmp/demo/api/go.mod; touch /tmp/demo/ml/requirements.txt; clear"
Enter
Sleep 1s
Show

Hide
Type@1ms "clear; print -P '%B%F{yellow}zoxide%f%b  jump to a folder by name'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "z dotfiles"
Sleep 300ms
Enter
Sleep 1.5s

Hide
Type@1ms "clear; print -P '%B%F{yellow}magic-enter%f%b  Enter on an empty prompt runs gst'"
Enter
Sleep 500ms
Show
Sleep 2s
Sleep 300ms
Enter
Sleep 2.5s

Hide
Type@1ms "clear; print -P '%B%F{yellow}eza%f%b  ls with icons and git status'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "ls"
Sleep 300ms
Enter
Sleep 2.5s

Hide
Type@1ms "clear; print -P '%B%F{yellow}bat%f%b  cat with syntax highlighting'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "cat config/mise/config.toml"
Sleep 300ms
Enter
Sleep 3s

Hide
Type@1ms "clear; print -P '%B%F{yellow}eza%f%b  tree view'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "lt config"
Sleep 300ms
Enter
Sleep 3s

Hide
Type@1ms "clear; print -P '%B%F{yellow}delta%f%b  syntax-highlighted git diffs'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "git show --format= 77df858 -- home/.zshrc"
Sleep 300ms
Enter
Sleep 3.5s

Hide
Type@1ms "clear; print -P '%B%F{yellow}fast-syntax-highlighting%f%b  typos turn red'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "gti"
Sleep 1s
Backspace 3
Type "git status"
Sleep 1s
Ctrl+U

Hide
Type@1ms "clear; print -P '%B%F{yellow}autopair%f%b  closes quotes and brackets'"
Enter
Sleep 500ms
Show
Sleep 2s
Type `echo "hello (world`
Sleep 1.5s
Ctrl+U

Hide
Type@1ms "clear; print -P '%B%F{yellow}smartdots%f%b  dots expand as you type'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "cd ...."
Sleep 1.5s
Ctrl+U

Hide
Type@1ms "clear; print -P '%B%F{yellow}sudo%f%b  Esc Esc adds sudo'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "brew services list"
Sleep 500ms
Escape
Escape
Sleep 1.5s
Ctrl+U

Hide
Type@1ms "clear; print -P '%B%F{yellow}aliases%f%b  search your aliases'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "als stash"
Sleep 300ms
Enter
Sleep 3s

Hide
Type@1ms "clear; print -P '%B%F{yellow}autosuggestions%f%b  press the right arrow to accept'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "cat c"
Sleep 1.2s
Right
Sleep 1.2s
Ctrl+U

Hide
Type@1ms "clear; print -P '%B%F{yellow}starship%f%b  time taken, red prompt on failure'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "sleep 2 && false"
Sleep 300ms
Enter
Sleep 3.5s

Hide
Type@1ms "cd /tmp/demo; clear; print -P '%B%F{yellow}mise + starship%f%b  the right Node, Go and Python version per project'"
Enter
Sleep 500ms
Show
Sleep 2s
Type "cd legacy-app && cat .nvmrc"
Sleep 300ms
Enter
Sleep 2.5s
Type "cd ../new-app"
Sleep 300ms
Enter
Sleep 2.5s
Type "cd ../api"
Sleep 300ms
Enter
Sleep 2.5s
Type "cd ../ml"
Sleep 300ms
Enter
Sleep 4s
