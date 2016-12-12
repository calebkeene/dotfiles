# Path to your oh-my-zsh installation.
export ZSH=/Users/calebkeene/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/Users/calebkeene/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR='vim'

# git
alias gp="git push origin"
alias gpu="git pull origin"
alias gd="git diff"
alias gt="git tag"
alias gft="git fetch --tags"
alias gpt="git push --tags"
alias gpo="git remote prune origin"
alias commitnow="git add . && git commit"
alias gco="git checkout"
alias gc="git commit"
alias gs="git status"
alias gl="git log"
alias ga="git add"
alias latest_tags='git log --tags --oneline --decorate --simplify-by-decoration'
alias lt='git fetch --tags && git describe --abbrev=0 --tags'

# bundle, deployment
alias be="bundle exec"
alias bu="bundle update"
alias blg="bundle list | grep"
alias csd="bundle exec cap staging docker:deploy"
alias cpd="bundle exec cap production deploy"

# rails development
alias rs="bundle exec rails s"
alias rc="bundle exec rails c" 
alias fs="bundle exec foreman start -f Procfile.dev"
alias rsk="kill -9 $(lsof -i tcp:3000 -t)"

# rails db
alias dbc="bundle exec rake db:create"
alias dbm="bundle exec rake db:migrate"
alias rgm="bundle exec rails g migration"
alias rdm="bundle exec rails d migration"
alias rr="bundle exec rake routes"

alias reloadrc="source ~/.zshrc"
alias dockerssh="ssh deploy@223.165.64.74"
alias docker2ssh="ssh deploy@223.165.66.112"