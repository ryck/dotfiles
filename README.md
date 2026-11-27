<p align="center">
  <img alt="" src="./assets/logo.svg" width="96">
</p>

# ryck’s dotfiles

Website: [dotfiles.ryck.dev](https://dotfiles.ryck.dev), with a one-page reference of the shortcuts, aliases and plugins below.

<p align="center">
  <img alt="A tour of the shell: zoxide, magic-enter, eza, bat, delta, syntax highlighting, autopair, smartdots, sudo, aliases, autosuggestions, Starship and per-project runtime versions" src="./assets/demo.gif" width="980px">
</p>

There are tons of useful things in here:

- The usefulness of [Oh My ZSH!](http://ohmyz.sh/) is already built–in.
- [Starship](https://starship.rs) as a prompt.
- Tmux configured in [`~/.tmux.conf`](home/.tmux.conf), with [tmux-lean](https://github.com/denysdovhan/tmux-lean): a minimal theme with process icons and light/dark colors.
- [Fish](https://fishshell.com/)-like autosuggestion in Zsh.
- Syntax highlighting of commands while they are typed.
- Automatically closing and deleting of quotes and brackets when you type them.
- Browser-like substring search for history.
- [zgenom](https://github.com/jandamm/zgenom) (maintained fork of zgen) for dependency management.
- [mise](https://mise.jdx.dev) for Node, Python and Go versions (replaces nvm, fnm and pyenv).
- [Atuin](https://atuin.sh) for searchable, synced shell history on `Ctrl-R`.
- [fzf](https://github.com/junegunn/fzf) and [fzf-tab](https://github.com/Aloxaf/fzf-tab) for fuzzy file, folder and completion pickers.
- VS Code as `$EDITOR`, with the [fresh](https://github.com/sinelaw/fresh) terminal editor as fallback.
- Lots of useful [aliases](./lib/aliases.zsh).
- Modern CLI tools like `eza` (smarter `ls`), `bat` (smarter `cat`), `zoxide` (smarter `cd`), `delta`, `lazygit`, `ripgrep`, `fd`, `btop`.
- Git config, global `.gitignore` file and aliases.
- Homebrew bundle for bootstrapping a macOS workstation (every package is listed in [`Brewfile.md`](./Brewfile.md)).
- A lot of useful [bins](./bin).
- `update` script for updating dotfiles, Zsh plugins, brew, mise runtimes, and apt packages.

Missing feature? Fork this repo and make it better.

## Highlights

### `git pull` never gets blocked

- **`~/.config` is a real directory**, not a symlink into the repo. Linking the whole folder would let every app write its state into the repo, so only the apps in [`config/`](./config) are linked one by one. See [How `~/.config` works](#how-config-works).
- **App-owned configs** (gh) are copied once from [`seed/`](./seed) instead of linked. `scripts/sync.sh` compares them with the repo.
- **`update` refuses to pull over local edits** and pulls with `--rebase --autostash`.

### Shell

- **[zgenom](https://github.com/jandamm/zgenom)** instead of zgen, which is archived. It's pinned to `~/.zgenom`.
- **Fewer Oh My Zsh plugins:** dropped `nvm`, `fnm`, `pyenv`, `deno`, a duplicate `direnv`, `gpg-agent`, `ssh-agent`, `codex`, `node` and `yarn`. Added `mise`.
- **[tinted-shell](https://github.com/tinted-theming/tinted-shell)** instead of the abandoned base16-shell.
- **[zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)** instead of alias-tips, which started Python before every command (~30ms each).
- **[fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)** instead of zsh-syntax-highlighting.
- **[Starship](https://starship.rs) instead of Spaceship**, configured in [`config/starship`](./config/starship/starship.toml): Starship's defaults with Nerd Font icons for Go, Node, Python and package versions, plus lines added and removed in the repo (`+3 -27`), and how long slow commands took on the right. The AWS and gcloud profiles are hidden. The `❯` turns red when a command fails. Inside a project it shows the Node, Go or Python version mise picked for it. The whole prompt draws in ~45ms, where Spaceship showed part of it after ~65ms and filled in versions ~0.4s later. Its init script is cached, so it adds nothing to startup.
- **New Oh My Zsh plugins:** `copypath` (copy the current folder's path), `copyfile` (copy a file's contents), `copybuffer` (`Ctrl-O` copies what you've typed), `dirhistory` (`Option-←/→` back/forward through visited folders, `Option-↑` parent folder), `uv` (completions), `git-commit` (`git feat -s zshrc "msg"` → `feat(zshrc): msg`), `magic-enter` (`Enter` on an empty prompt runs `gst -u .` in a repo, `ls` elsewhere) and `aliases` (`als git` searches your aliases).
- **`_extend_path` checks `PATH` in pure zsh** instead of running `echo | tr | grep` on every call.
- `EDITOR` is VS Code (`code --wait`), falling back to [fresh](https://github.com/sinelaw/fresh), then `nano`, then `vim`. Over SSH VS Code is skipped. Git and lazygit follow it. `XDG_CONFIG_HOME` is set.
- Personal settings live in tracked [`lib/exports.zsh`](./lib/exports.zsh) and [`lib/functions.zsh`](./lib/functions.zsh). `custom/` stays a gitignored extension point.

### Tools

- **[mise](https://mise.jdx.dev)** manages Node (LTS), Python (latest) and Go (latest), replacing nvm, fnm and pyenv. `update` upgrades them, and `bootstrap.sh` installs them.
- **New CLI tools:** [atuin](https://atuin.sh) (history search on `Ctrl-R`), [lazygit](https://github.com/jesseduffield/lazygit), [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd), [jq](https://jqlang.org), [yq](https://github.com/mikefarah/yq), [btop](https://github.com/aristocratos/btop), [tealdeer](https://github.com/tealdeer-rs/tealdeer), [uv](https://docs.astral.sh/uv/), [hyperfine](https://github.com/sharkdp/hyperfine) (benchmarking).
- **Brewfile** is rebuilt from what's actually installed on my Mac, with unused apps removed. Third-party taps are marked `trusted: true`. [`Brewfile.md`](./Brewfile.md) explains how to use it and describes every package.
- **[`brew-usage`](./bin/brew-usage)** lists installed Homebrew packages by when you last used them, to find ones to remove.

### Startup time

Measured on my Mac with `time zsh -i -c exit` (warm, average of 3 runs):

| Step | Startup |
| --- | --- |
| Original setup (zgen, all plugins) | ~0.85s |
| zgenom + dropping nvm/fnm/pyenv/deno | ~0.72s |
| Dropping `gpg-agent`, `ssh-agent`, `codex`, `node` | ~0.34s |
| Dropping `yarn` | ~0.22s |
| Pure-zsh `_extend_path` | ~0.18s |
| Adding you-should-use, fast-syntax-highlighting, `copypath`, `copyfile`, `copybuffer`, `dirhistory`, `uv` | ~0.20s |
| Starship instead of Spaceship (measured with `hyperfine`, 20 runs) | **~0.21s** (Spaceship: ~0.22s) |

That's about **4× faster** than the original setup, with more features. Most of the gain came from `gpg-agent`, which ran `gpgconf` on every shell start (~380ms), and `yarn`, which ran `yarn global bin` (~130ms).

## Installation

Tell Git who you are using these commands:

```sh
git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"
```

Clone dotfiles repo:

```sh
# Clone dotfiles repo
git clone https://github.com/ryck/dotfiles.git $HOME/.dotfiles

# Go to the dotfiles directory
cd $HOME/.dotfiles

# Install dotfiles
./install
```

On a new Mac, then bootstrap it. This installs Homebrew, Git and Zsh, everything in the [`Brewfile`](./Brewfile) (including `mise`), the Node/Python/Go runtimes from [`config/mise`](./config/mise/config.toml) via `mise install`, and a few global npm packages:

```sh
./scripts/bootstrap.sh
```

`./install` also links [`config/agents/AGENTS.md`](./config/agents/AGENTS.md) into supported agent config directories when those directories already exist: `~/.codex`, `~/.cursor`, `~/.config/github-copilot`, `~/.config/opencode`, and `~/.claude` (as `CLAUDE.md`).

## Updating

Use a single command to get the latest updates:

```sh
update
```

This command refreshes `sudo`, pulls the latest dotfiles, reruns `./install --except shell`, updates `zgenom` and Zsh plugins, and updates `brew` and `mise` when available.

`update` refuses to pull if the repo has uncommitted changes. Commit them, or move machine-specific settings to `~/.zshlocal`, `~/.gitlocal` or `custom/`.

## How `~/.config` works

`~/.config` is a real directory, not a symlink to this repo. Apps can write whatever they want there without touching the repo.

- **Linked configs** live in [`config/`](./config) and are symlinked per app by `install.conf.yaml` (`~/.config/ghostty` → `config/ghostty`, etc.). Editing them edits the repo. To track a new app, move its folder into `config/` and add a `link:` line.
- **App-owned configs** that apps rewrite themselves (gh `config.yml`) live in [`seed/`](./seed). `scripts/seed.sh` copies them into `$HOME` once, only if they're missing, so the app owns the live copy and the repo never gets dirty.
  - `./scripts/sync.sh` shows a diff between the live copies and `seed/`.
  - `./scripts/sync.sh --pull` copies the live copies into `seed/` so you can review and commit them.

## Under the hood

> **Note:** You may put your custom settings into `~/.zshlocal`, or into `custom/*.zsh` (loaded automatically and never committed).

### Projects tree

I suggest you to organize project folder as follows:

```txt
~/Projects
├── Forks       # for GitHub fork
├── Job         # for job projects
├── Playground  # for short-term experiments
└── Repos       # for long-term projects
```

### Keyboard shortcuts

| Keys | Does |
| --- | --- |
| `Ctrl-R` | Search history with [Atuin](https://atuin.sh). Press `Ctrl-R` again to switch between all history, this machine, this session, and this folder. |
| `↑` / `↓` | Search history for commands starting with what you've typed |
| `Tab` | Completion menu you can fuzzy-search ([fzf-tab](https://github.com/Aloxaf/fzf-tab)) |
| `Ctrl-T` | Pick a file with fzf and insert its path |
| `Esc` then `C` | Pick a folder with fzf and `cd` into it (`Option-C` if your terminal sends Option as Alt) |
| `Esc` `Esc` | Re-run the current or previous command with `sudo` |
| `Ctrl-O` | Copy what you've typed to the clipboard without running it |
| `Enter` on an empty prompt | Run `gst -u .` (`git status`) in a repo, `ls -lh` elsewhere (`magic-enter`) |
| `Option-←` / `Option-→` | Back / forward through folders you've visited (`dirhistory`) |
| `Option-↑` / `Option-↓` | Go to the parent folder / into the first subfolder |
| `Ctrl-←` / `Ctrl-→` | Jump one word back / forward |
| `...` | Typing dots expands them: `...` → `../..` |

### Aliases

Aliases are going to make your work fast and enjoyable. See code in `$DOTFILES/lib/aliases.zsh`. Here is what's included:

- Aliases from Oh-My-Zsh. See [Oh-My-Zsh Cheatsheet](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#commands) for more.
- Easier navigation
  - **`..`** → `cd ..`
  - **`...`** → `cd ../..`
  - **`....`** → `cd ../../..`
  - **`.....`** → `cd ../../../..`
  - **`~`** → `cd ~`
  - **`-`** → `cd -`
- Folders shortcuts
  - **`dl`** → `cd ~/Downloads`
  - **`dt`** → `cd ~/Desktop`
  - **`pj`** → `cd ~/Projects`
  - **`pjr`** → `cd ~/Projects/Repos`
  - **`pjf`** → `cd ~/Projects/Forks`
  - **`pjj`** → `cd ~/Projects/Job`
  - **`pjl`** → `cd ~/Projects/Playground`
- Commands Shortcuts
  - **`e`** → open in `$EDITOR` without waiting (VS Code)
  - **`+x`** → `chmod +x`
  - **`x+`** → `chmod +x`
  - **`reload`** → reload `~/.zshrc`
  - **`clr`** → `clear`
  - **`q`** → go home and clear the screen
- Open
  - **`open <FILE>`** — open file from terminal.
  - **`o <FILE>`** — open file from terminal.
  - **`oo`** — open current folder.
  - **`term`** — open iTerm.
- macOS
  - **`show`** / **`hide`** — show or hide hidden files in Finder.
  - **`cleanup`** — recursively delete `.DS_Store` files.
  - **`cdf`** — `cd` into the folder open in the front Finder window.
  - **`copypath`** — copy the current folder's path. **`copyfile <file>`** copies a file's contents.
- Misc
  - **`update`** — get updates (Runs `$DOTFILES/scripts/update.sh`).
  - **`bootstrap`** — run machine bootstrap (Runs `$DOTFILES/scripts/bootstrap.sh`).
  - **`dotfiles`** — jump quickly into dotfiles folder.
  - **`myip`** — my local IP address.
  - **`password`** — generate random password, copies it into clipboard and outputs it to terminal.
  - **`path`** — print $PATH in readable view.
  - **`getpage`** — download web page with all assets.
  - **`get`** — download file with original filename.
  - **`git-root`** / **`cdgr`** — jump to the current repo root.
  - **`mkd <dir>`** — create a folder and `cd` into it.
  - **`extract <file>`** — unpack any archive.
- Tools (only when installed)
  - **`help`** → `tldr`.
  - **`lg`** → `lazygit`.
  - **`md <file>`** → render Markdown with `glow`.
  - **`top`** → `btop`.
  - **`lt`** → tree view with `eza`; **`l`** → long list; **`la`** → long list including hidden files.
  - **`cc`** → `claude`; **`ccx`** → Claude Code in `~/Projects/Playground` with auto permissions.
  - **`cx`** → `codex`; **`cxx`** → Codex in `~/Projects/Playground` with `--full-auto`.

Depending on installed tools, `ls` uses `eza`, `cat` uses `bat`, `cd` uses `zoxide`, and `top` uses `btop`. `rm`, `cp` and `mv` ask before deleting or overwriting (`-i`, from the `common-aliases` plugin).

### Zsh plugins

Oh My Zsh plugins (see [`.zshrc`](./home/.zshrc)):

- **Git & GitHub:** [`git`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) (aliases like `gst`, `gco`, `gp`), [`git-commit`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-commit) (`git feat`, `git fix`, `git chore`… for conventional commits), [`gh`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gh) (completions).
- **History & navigation:** [`history-substring-search`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history-substring-search), [`fzf`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf), [`zoxide`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zoxide), [`dirhistory`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory).
- **Runtimes & packages:** [`mise`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/mise) (see [`config/mise`](./config/mise/config.toml)), [`npm`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm), [`uv`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/uv), [`brew`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew), [`direnv`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/direnv).
- **Containers & terminal:** [`docker`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker), [`docker-compose`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose), [`tmux`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux).
- **Helpers:** [`sudo`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo), [`extract`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract), [`copypath`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath), [`copyfile`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile), [`copybuffer`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copybuffer), [`magic-enter`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/magic-enter), [`aliases`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases) (`als`), [`common-aliases`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases), [`command-not-found`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found), [`tldr`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tldr), [`macos`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos), [`vscode`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode).

Other plugins:

- [Starship](https://starship.rs) prompt, configured in [`config/starship`](./config/starship/starship.toml).
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) for fuzzy `Tab` completion, plus [zsh-completions](https://github.com/zsh-users/zsh-completions).
- [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use) reminds you when an alias exists for what you typed.
- [zsh-autopair](https://github.com/hlissner/zsh-autopair) closes quotes and brackets.
- [omz-plugin-pnpm](https://github.com/ntnyq/omz-plugin-pnpm): pnpm aliases (`p`, `pa`, `pad`, `pin`, `pr`, `pd`, `pb`, `pt`, `pdx`…) and `PNPM_HOME` on `PATH`. Its `p` replaces common-aliases' `p` (`ps -f`).
- [tinted-shell](https://github.com/tinted-theming/tinted-shell) for base16 terminal color schemes.

### Bin

Dotfiles also include some functions that will make your life easier. See code in [`bin/`](./bin).

- [`brew-usage`](./bin/brew-usage) — list installed Homebrew formulae and apps by when you last used them, to spot ones you can remove.
- [`emptytrash`](./bin/emptytrash) — empty the Trash on all mounted volumes and the main HDD.
- [`git-cleanup`](./bin/git-cleanup) — removes old Git branches and does other cleanup.
- [`git-fork`](./bin/git-fork) — add remote upstream.
- [`git-upstream`](./bin/git-upstream) — sync branch with upstream.
- [`gz`](./bin/gz) — get gzipped file size
- [`n`](./bin/n) — runs given command using binary in `node_modules/.bin` of the current project.
- [`nyan`](./bin/nyan) — print [nyan cat](https://www.youtube.com/watch?v=QH2-TGUlwu4).
- [`password`](./bin/password) — generate a random password and copy it to the clipboard.

### Git

> **Note:** Add your git user data and custom settings to `~/.gitlocal`.

#### Configuration

- UI color is `auto`.
- Default branch is `main`.
- Diff colors are:
  - `white bold` for meta information;
  - `cyan bold` for frag;
  - `red bold` for old lines;
  - `green bold` for new lines.
- Diffs are shown with [delta](https://github.com/dandavison/delta) (line numbers, `n`/`N` to jump between files, clickable paths).
- Editor follows `$EDITOR` (VS Code locally, fresh over SSH or without VS Code).
- `push.default` set as `current`.
- `pull.rebase` set to `true`.
- `push.autoSetupRemote` set to `true`.
- `rerere` enabled for conflict resolution reuse.
- Automatic replacement `git://github.com/`, `gh:`, `github:` addresses as `git@github.com:` for GitHub.
- Automatic replacement `git://gist.github.com/`, `gst:`, `gist:` addresses as `git@gist.github.com:` for Gists.
- User custom settings gets from a `~/.gitlocal` file.

#### Git Aliases

- **`git a`** → `git add` — stage files.
- **`git ua`** → `git reset HEAD` — unstage files.
- **`git b`** → `git branch` — list, create, or delete branches.
- **`git c`** → `git commit` — record changes to the repository.
- **`git m`** → `git merge` — merge branches.
- **`git mc`** → `git merge --continue` — continue merge after resolving conflicts.
- **`git co`** → `git checkout` — checkout a branch or paths to the working tree.
- **`git cb`** → `git checkout -b` — create and checkout branch.
- **`git sw`** → `git switch` — switch branches.
- **`git swc`** → `git switch -c` — create and switch branch.
- **`git ap`** → `git add -p` — stage changes hunk by hunk.
- **`git ca`** → `git commit -a` — commit with automatically stage files that have been modified and deleted.
- **`git cm`** → `git commit -m` — commit with commit message.
- **`git cam`** → `git commit -am` — add all files and commit with message.
- **`git s`** → `git status -sb` — short status with current branch.
- **`git main`** — go to `main` branch and pull from remote.
- **`git master`** — go to `master` branch and pull from remote.
- **`git develop`** — go to `develop` branch and pull from remote.
- **`git memain`** / **`git memaster`** — fetch latest `main` / `master` and merge it into the current branch.
- **`git remain`** / **`git remaster`** — fetch latest `main` / `master` and rebase the current branch onto it (with autostash).
- **`git git`** — do not complain about `git git`.
- **`git l`** — commits log with pretty single line format.
- **`git ll`** — log with list of changed files for each commit.
- **`git ignore`** — ignore files: append file to `.gitignore`.
- **`git this`** — initialize, add all files and commit.
- **`git amend`** — amend last commit.
- **`git redo`** — amend last commit with its original message.
- **`git undo`** → `reset --mixed HEAD^` — reset index changes, but not the working tree.
- **`git discard`** → `checkout --` — discard changes.
- **`git contrib`** — list of contributors and how many commits each person has.
- **`git today`** — see how many lines of code you have written today.
- **`git sync`** — pull and push changes from/to remote.
- **`git lazy`** — open `lazygit`.
- **`git-root`** — go to repo root.
- **`git-cleanup [--force]`** — removes old Git branches.
- **`git-fork <original-author>`** — add remote upstream.
- **`git-upstream [branch]`** — sync branch with upstream (defaults to `master`).

## Resources

Resources that I used to make these dotfiles better:

- [GitHub ❤ ~/](http://dotfiles.github.com/)
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

## Credits

Originally based on [Denys Dovhan’s dotfiles](https://github.com/denysdovhan/dotfiles).

## License

MIT © [Denys Dovhan](https://denysdovhan.com), Ricardo Gonzalez
