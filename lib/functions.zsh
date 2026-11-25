#
# Functions
#

# Create a new directory and enter it
mkd() {
  mkdir -p "$@" && cd "$_"
}
alias mkcd='mkd' # replaces Oh My Zsh's mkcd/takedir

# Change working directory to the top-most Finder window location
cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}
