export ZSH=~/.oh-my-zsh
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=vim
export GATSBY_TELEMETRY_DISABLED=1
export ZSH_DISABLE_COMPFIX=true
export DISABLE_SPRING=true
export DISABLE_BETTER_ERRORS=true

ZSH_THEME="jreese"
DEFAULT_USER="$USER"

plugins=(git rails bundler macos docker)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Openssl config
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# brew - must be before other exports (at least rbenv)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# openJDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Add composer to PATH for scripting.
export PATH="$PATH:$HOME/.composer/vendor/bin"

source $ZSH/oh-my-zsh.sh

# Source zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source aliases and functions:
for file in ~/dotfiles/zsh/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
# add nvm support
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
  
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
