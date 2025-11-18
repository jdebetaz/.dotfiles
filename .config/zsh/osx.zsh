# Setup Homebrew
[[ -d "/opt/homebrew" ]] ||  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/opt/homebrew/bin:$PATH"

# Install Homebrew packages
[[ -f "/opt/homebrew/bin/sig" ]] || brew install ynqa/tap/sigrs
[[ -f "/opt/homebrew/bin/eza" ]] || brew install eza
[[ -f "/opt/homebrew/bin/bat" ]] || brew install bat

# pnpm
export PNPM_HOME="/Users/jonathan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
