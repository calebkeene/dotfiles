export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

eval "$(rbenv init -)"
export ZSH=/Users/caleb/.oh-my-zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"
plugins=(git bundler osx rake ruby)
export PATH="/usr/local/sbin:$PATH"
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

alias gco="git checkout"
alias gl="git log"
alias gd="git diff"
alias gs="git status"
alias gc="git commit"
alias gca="git add . && git commit"
alias gp="git push origin"
alias gpu="git pull origin"
alias gpuc="git pull origin $(git branch | grep "*" | awk {'print $2'})"
alias gpc="git push origin HEAD"

alias gpb="git push origin $(git rev-parse --abbrev-ref HEAD)"
alias postgres-start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres-stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias runspecs="bundle exec rspec spec"
alias cop="bundle exec rubocop -a -D"
alias be="bundle exec"
alias dbmigrate="bundle exec rake db:migrate"
alias dbseed="bundle exec rake db:seed"

alias subl2="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

alias oshpark-cucumber="bundle exec cucumber --tags @javascript --tags ~@wip"
alias cc="echo '!!' | xclip"
alias fms="bundle exec foreman start -f"
alias js="bundle exec jekyll serve -I -L"

alias db-unpack="tar xvf database.tar && gzip -d database/databases/PostgreSQL.sql.gz"
alias rz="source ~/.zshr"

alias running-servers="lsof -i -P -n | grep LISTEN"

alias docker-list-containers="docker ps -a"

alias start-es="brew services start elasticsearch-full"
alias stop-es="brew services stop elasticsearch-full"

function docker-stop-and-remove-containers() {
  echo "stopping containers"
  docker stop $(docker ps -a -q)
  echo "removing containers"
  docker rm $(docker ps -a -q)
}

alias docker-remove-untagged-images="docker images -a | grep '<none>' | awk '{print $3}' | xargs docker rmi"
alias docker-remove-all-images="docker rmi $(docker images -a -q)"

alias yi="yarn install"
alias yic="yarn install --check-packages"

function pid-by-port() {
  if [ "$1" != "" ]
  then
    lsof -i tcp:"$1" | awk 'FNR==2{print $2}'
  else
    echo "Missing argument! Usage: pid-by-port $PORT"
  fi
}

function kill-by-port() {
  if [ "$1" != "" ]
  then
    kill -9 $(lsof -ni tcp:"$1" | awk 'FNR==2{print $2}')
  else
    echo "Missing argument! Usage: kill-by-port $PORT"
  fi
}

function kill-heroku-build() {
  if [ "$1" != "" && "$2" != "" ]
  then
    heroku builds:cancel -a $1 $2
  else
    echo "Missing argument! Usage: kill-heroku-build $APP_NAME $BUILD_ID"
  fi
}

function open-bundle() {
  if [ -f "Gemfile" ]; then
    if [[ -z "${EDITOR}" ]]; then
      echo "make sure \$EDITOR is set"
    else
      if [ "$1" != "" ]; then
        $EDITOR $(bundle info $1 | sed -n '4 p' | awk '{print $2}')
      else
        echo "Usage: open-bundle $GEM_NAME"
      fi
    fi
  else
    echo "No Gemfile detected"
  fi
}
