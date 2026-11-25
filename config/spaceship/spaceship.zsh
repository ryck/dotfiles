# Spaceship prompt config, loaded from ~/.config/spaceship/spaceship.zsh
# https://spaceship-prompt.sh/config/intro/

# Only the sections I use. Fewer sections means fewer checks on every prompt.
# user and host only show over SSH or as root.
SPACESHIP_PROMPT_ORDER=(
  user          # Username
  dir           # Current directory
  host          # Hostname
  git           # Git branch and status
  package       # package.json version
  node          # Node.js (mise)
  python        # Python (mise)
  venv          # Python virtualenv
  uv            # uv project
  golang        # Go (mise)
  rust          # Rust
  docker        # Docker, when there's a Dockerfile or compose file
  async         # Indicator while async sections load
  line_sep      # Line break
  jobs          # Background jobs
  exit_code     # Exit code of the last failed command
  sudo          # Cached sudo credentials
  char          # Prompt character
)

# Right side: how long the last command took (only when over 2s)
SPACESHIP_RPROMPT_ORDER=(
  exec_time
)

# Show the exit code of a failed command, e.g. ✘ 127
SPACESHIP_EXIT_CODE_SHOW=true
