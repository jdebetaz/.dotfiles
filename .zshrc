# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  Setup ZSH package manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share/zinit/zinit.git}"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10K
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Setup Vim package manager
[[ -f ~/.vim/autoload/plug.vim ]] || curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2024-05-31 16:50:16
[[ ! -d "$HOME/.local/bin" ]] || export PATH="$PATH:$HOME/.local/bin"

# Declare NVM_DIR if it exists
[[ ! -d "$HOME/.nvm" ]] || export NVM_DIR="$HOME/.nvm"

# OS Specific install
if [[ $(uname) == "Darwin" ]]; then
    source ~/.config/zsh/osx.zsh
elif [[ $(uname) == "Linux" ]]; then
    source ~/.config/zsh/linux.zsh
else
    source /etc/os-release
    DISTRO="$(echo $NAME | tr '[:upper:]' '[:lower:]')"
    [[ ! -f "$HOME/.config/zsh/$DISTRO.zsh" ]] || source "$HOME/.config/zsh/$DISTRO.zsh"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias ll='ls -al'

# Shell integrations
eval "$(fzf --zsh)"

export GPG_TTY=$(tty)
unset SSH_AGENT_PID
[[ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]] &&  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
