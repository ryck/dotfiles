#
# Key bindings
#

# dirhistory takes over Option-Left/Right for folder history. Give them back to
# word jumps (Ghostty and Terminal.app send ^[b / ^[f, xterm-style terminals
# send \e[1;3D / \e[1;3C) and keep dirhistory on Option-Up/Down only.
for keymap in emacs viins vicmd; do
  for key in '^[b' '\e[1;3D' '\e[3D' '\e\e[D' '\eO3D'; do
    bindkey -M $keymap "$key" backward-word
  done
  for key in '^[f' '\e[1;3C' '\e[3C' '\e\e[C' '\eO3C'; do
    bindkey -M $keymap "$key" forward-word
  done
done
unset keymap key
