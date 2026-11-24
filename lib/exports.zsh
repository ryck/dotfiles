#
# Exports
#

# GPG needs to know the current TTY for pinentry
export GPG_TTY=$(tty)

# Hide Homebrew's environment hints
export HOMEBREW_NO_ENV_HINTS=1

# Java (Zulu 17), used by Android / React Native builds
if [[ -d /Library/Java/JavaVirtualMachines/zulu-17.jdk ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
fi

# Android SDK
if [[ -d "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  _extend_path "$ANDROID_HOME/emulator"
  _extend_path "$ANDROID_HOME/platform-tools"
fi

# Homebrew Ruby and its gems (CocoaPods etc.)
if [[ -d /opt/homebrew/opt/ruby/bin ]]; then
  _extend_path /opt/homebrew/opt/ruby/bin
  for gem_bin in /opt/homebrew/lib/ruby/gems/*/bin(N); do
    _extend_path "$gem_bin"
  done
  unset gem_bin
fi

# Go, Rust and Antigravity binaries
_extend_path "$HOME/go/bin"
_extend_path "$HOME/.cargo/bin"
_extend_path "$HOME/.antigravity/antigravity/bin"
