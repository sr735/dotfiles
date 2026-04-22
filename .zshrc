# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="mysteeef"

# Auto-update interval (in days).
export UPDATE_ZSH_DAYS=13

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
# Note: 'osx' plugin was renamed to 'macos' in Oh-My-Zsh.
plugins=(git git-extras brew macos pyenv sudo zsh-syntax-highlighting vscode)

# Homebrew prefix — supports both Apple Silicon (/opt/homebrew) and Intel (/usr/local)
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-$(brew --prefix 2>/dev/null || echo /usr/local)}"
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Library/:$PATH"
# User-local bins
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Aliases
alias mkdir="mkdir -p"
alias mv="mv -iv"
alias cp="cp -iv"
alias cpdir="cp -Riv"
alias rm="rm -v"
alias del="mv $1 ~/.unixtrash"
alias rd="rm -rv"
alias hd="head"
alias tl="tail"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bashconfig="vim ~/.bash_profile"
alias sshconfig="vim ~/.ssh/config"
alias rdc="rsync -avz -f'- .??*/'"
alias whoami="echo 'I AM GROOT'"
# Ensure python/pip resolve to python3/pip3
alias python="python3"
alias pip="pip3"

# Functions
function hide(){
    defaults write com.apple.finder AppleShowAllFiles -bool false
    killall Finder
}
function show(){
    defaults write com.apple.finder AppleShowAllFiles -bool true
    killall Finder
}

# cecho utility — only load if present
[[ -f "$HOMEBREW_PREFIX/sbin/cecho.sh" ]] && source "$HOMEBREW_PREFIX/sbin/cecho.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
