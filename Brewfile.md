# Brewfile

The [`Brewfile`](./Brewfile) lists every Homebrew formula, cask and Mac App Store app this Mac should have. [Homebrew Bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile) reads it, so one command sets up a new machine.

## How to use it

```sh
brew bundle check     # show what's missing
brew bundle           # install everything missing
brew bundle cleanup   # list installed packages that aren't in the Brewfile
brew bundle cleanup --force   # uninstall them
```

Run these from the repo root, or pass `--file ~/.dotfiles/Brewfile` from anywhere.

- **New Mac:** [`scripts/bootstrap.sh`](./scripts/bootstrap.sh) runs `brew bundle` for you.
- **Add a package:** `brew install <name>`, then add a `brew "<name>"` or `cask "<name>"` line to the right section.
- **Remove a package:** delete its line, then run `brew bundle cleanup --force`.
- **Find unused packages:** [`brew-usage`](./bin/brew-usage) lists installed packages by when you last used them.
- **App Store apps** (`mas`) need you to be signed in to the App Store. The ID is the number in the app's App Store URL.
- **Third-party taps** are marked `trusted: true` so Homebrew doesn't warn about them.

## Taps

| Tap | Provides |
| --- | --- |
| [ramonvermeulen/whosthere](https://github.com/ramonvermeulen/whosthere) | `whosthere` |
| [sinelaw/fresh](https://github.com/sinelaw/fresh) | `fresh` |
| [taylorwilsdon/tap](https://github.com/taylorwilsdon/reclaimed) | `reclaimed` |
| [wyne/tap](https://github.com/wyne/fasder) | `fasder` |

## Shell & core

| Package | Description |
| --- | --- |
| [git](https://git-scm.com) | Version control |
| [zsh](https://www.zsh.org/) | The shell |
| [zsh-completions](https://github.com/zsh-users/zsh-completions) | Extra completion definitions for zsh |
| [tmux](https://tmux.github.io/) | Terminal multiplexer |
| [neovim](https://neovim.io/) | Vim-based editor |
| [coreutils](https://www.gnu.org/software/coreutils/) | GNU file, shell and text utilities |
| [wget](https://www.gnu.org/software/wget/) | Download files from the web |
| [mas](https://github.com/mas-cli/mas) | Mac App Store CLI (installs the `mas` apps below) |
| [gh](https://cli.github.com/) | GitHub CLI |

## Modern CLI tools

| Package | Description |
| --- | --- |
| [eza](https://eza.rocks) | Better `ls` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Better `cd` (jump to frequent directories) |
| [fzf](https://junegunn.github.io/fzf/) | Fuzzy finder |
| [atuin](https://atuin.sh/) | Searchable, synced shell history (`Ctrl-R`) |
| [starship](https://starship.rs/) | Fast shell prompt (see [`config/starship`](./config/starship/starship.toml)) |
| [hyperfine](https://github.com/sharkdp/hyperfine) | Command-line benchmarking |
| [bat](https://github.com/sharkdp/bat) | Better `cat` with syntax highlighting |
| [git-delta](https://dandavison.github.io/delta/) | Better `git diff` |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Better `grep` |
| [fd](https://github.com/sharkdp/fd) | Better `find` |
| [jq](https://jqlang.github.io/jq/) | JSON processor |
| [yq](https://github.com/mikefarah/yq) | YAML, XML and CSV processor |
| [btop](https://github.com/aristocratos/btop) | Better `top` |
| [tealdeer](https://tealdeer-rs.github.io/tealdeer/) | Fast `tldr` client (short command examples) |
| [glow](https://github.com/charmbracelet/glow) | Render Markdown in the terminal |
| [yazi](https://yazi-rs.github.io) | Terminal file manager |
| [direnv](https://direnv.net/) | Per-directory environment variables |
| [ncdu](https://dev.yorhel.nl/ncdu) | Disk usage explorer |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |
| [prettyping](https://denilsonsa.github.io/prettyping/) | Nicer `ping` output |
| [wifi-password](https://github.com/rauchg/wifi-password) | Show the current Wi-Fi password |
| [terminal-notifier](https://github.com/julienXX/terminal-notifier) | Send macOS notifications from the terminal |
| [fasder](https://github.com/wyne/fasder) | Quick access to recent files and directories |
| [fresh](https://github.com/sinelaw/fresh) | Terminal text editor, the `$EDITOR` fallback |
| [reclaimed](https://github.com/taylorwilsdon/reclaimed) | Disk usage analyzer with iCloud support |
| [mole](https://mole.fit) | Clean up and optimize the Mac |
| [clippy](https://github.com/neilberkman/clippy) | Copy files from the terminal so they paste into GUI apps |
| [copyparty](https://github.com/9001/copyparty) | Portable file server |
| [gptfdisk](https://www.rodsbooks.com/gdisk/) | Disk partitioning tools (`gdisk`) |
| [qpdf](https://qpdf.sourceforge.io/) | Inspect and transform PDF files |
| [audacious](https://audacious-media-player.org/) | Lightweight audio player |

## Runtimes & dev tools

| Package | Description |
| --- | --- |
| [mise](https://mise.jdx.dev/) | Node, Python and Go versions (see [`config/mise`](./config/mise/config.toml)) |
| [uv](https://docs.astral.sh/uv/) | Fast Python package and tool manager |
| [pnpm](https://pnpm.io/) | Fast, disk-efficient JS package manager |
| [rust](https://www.rust-lang.org/) | Rust compiler and Cargo |
| [biome](https://biomejs.dev/) | JS/TS formatter and linter |
| [tailwindcss](https://tailwindcss.com) | Tailwind CSS CLI |
| [watchman](https://meta.github.io/watchman/) | File watching for Jest and React Native |
| [cocoapods](https://cocoapods.org/) | iOS/macOS dependency manager |
| [cfssl](https://cfssl.org/) | Cloudflare's TLS/PKI toolkit |
| [pygments](https://pygments.org/) | Syntax highlighter (`pygmentize`) |

## Fonts

| Cask | Description |
| --- | --- |
| [font-fira-code](https://github.com/tonsky/FiraCode) | Fira Code, monospace font with ligatures |
| [font-fira-code-nerd-font](https://github.com/ryanoasis/nerd-fonts) | Fira Code with Nerd Font icons |
| [font-hasklug-nerd-font](https://github.com/ryanoasis/nerd-fonts) | Hasklig with Nerd Font icons |
| [font-jetbrains-mono](https://www.jetbrains.com/lp/mono) | JetBrains Mono |

## Utils

| Cask | Description |
| --- | --- |
| [1password](https://1password.com/) | Password manager |
| [rectangle](https://rectangleapp.com/) | Window snapping with keyboard shortcuts |
| [betterdisplay](https://betterdisplay.pro/) | Display resolution and scaling control |
| [pearcleaner](https://itsalin.com/appInfo/?id=pearcleaner) | Uninstall apps and their leftover files |
| [numi](https://numi.app/) | Text-based calculator and converter |
| [gpg-suite](https://gpgtools.org/) | GPG keys and agent (signs git commits) |
| [dropbox](https://www.dropbox.com/) | Cloud storage |
| [the-unarchiver](https://theunarchiver.com/) | Open any archive format |
| [syntax-highlight](https://github.com/sbarex/SourceCodeSyntaxHighlight) | Quick Look previews for source code |
| [imageoptim](https://imageoptim.com/mac) | Shrink image file sizes |
| [vorssaint](https://github.com/vorssaint/vorssaint-utils) | Menu bar keep-awake, system monitor and volume mixer |

## Media

| Cask | Description |
| --- | --- |
| [transmission](https://transmissionbt.com/) | BitTorrent client |
| [handbrake-app](https://handbrake.fr/) | Video transcoder |
| [vlc](https://www.videolan.org/vlc/) | Media player |
| [iina](https://iina.io/) | Modern macOS media player |
| [plex](https://www.plex.tv/) | Home media player |
| [spotify](https://www.spotify.com/) | Music streaming |
| [tinycast](https://tinycast.dev/) | App launcher |

## Terminals & editors

| Cask | Description |
| --- | --- |
| [ghostty](https://ghostty.org/) | GPU-accelerated terminal (main terminal, see [`config/ghostty`](./config/ghostty/config)) |
| [iterm2](https://iterm2.com/) | Terminal emulator |
| [visual-studio-code](https://code.visualstudio.com/) | Code editor, the `$EDITOR` |
| [zed](https://zed.dev/) | Fast code editor |
| [cursor](https://www.cursor.com/) | AI code editor |

## Development

| Cask | Description |
| --- | --- |
| [github](https://desktop.github.com/) | GitHub Desktop |
| [docker-desktop](https://www.docker.com/products/docker-desktop) | Containers |
| [android-platform-tools](https://developer.android.com/tools/releases/platform-tools) | `adb` and `fastboot` |
| [zulu@17](https://www.azul.com/downloads/) | OpenJDK 17 (used as `JAVA_HOME`) |
| [bruno](https://www.usebruno.com/) | API client |
| [yaak](https://yaak.app/) | REST, GraphQL and gRPC client |
| [macusb](https://www.macusb.app/) | Create bootable macOS USB installers |
| [figma](https://www.figma.com/) | Design tool |
| [whosthere](https://github.com/ramonvermeulen/whosthere) | Local network discovery TUI |

## Agents

| Cask | Description |
| --- | --- |
| [claude-code](https://claude.com/product/claude-code) | Claude coding agent in the terminal |
| [copilot-cli](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli) | GitHub Copilot agent in the terminal |

## Desktop applications

| Cask | Description |
| --- | --- |
| [google-chrome](https://www.google.com/chrome/) | Web browser |
| [firefox](https://www.mozilla.org/firefox/) | Web browser |
| [brave-browser](https://brave.com/) | Privacy-focused web browser |
| [slack](https://slack.com/) | Team chat |
| [discord](https://discord.com/) | Voice and text chat |
| [telegram](https://macos.telegram.org/) | Messaging |
| [whatsapp](https://www.whatsapp.com/) | Messaging |
| [zoom](https://www.zoom.us/) | Video calls |
| [notion](https://www.notion.com/) | Notes and docs |

## App Store applications

| App | Description |
| --- | --- |
| [Amphetamine](https://apps.apple.com/app/id937984704) | Keep the Mac awake |
| [Bear](https://apps.apple.com/app/id1091189122) | Markdown notes |
| [Developer](https://apps.apple.com/app/id640199958) | Apple developer videos and docs |
| [Home Assistant](https://apps.apple.com/app/id1099568401) | Home Assistant companion app |
| [Menu Bar Calendar](https://apps.apple.com/app/id1558360383) | Calendar in the menu bar |
| [NordVPN](https://apps.apple.com/app/id905953485) | VPN |
| [Pure Paste](https://apps.apple.com/app/id1611378436) | Paste as plain text |
| [Xcode](https://apps.apple.com/app/id497799835) | Apple IDE and SDKs |
