# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export JAVA_HOME=$(/usr/libexec/java_home -v 17.0.4)
export HOMEBREW_NO_AUTO_UPDATE=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mh"

### Aliases ###
alias vim='nvim'
alias vi='nvim'

alias so="source"
alias ninit='vi ~/.config/nvim/init.vim'
alias redis="docker run --rm -itd -p 6379:6379 --name redis redis"
alias mk="minikube"

# development
alias tt='tmux attach-session'
alias lint='npm run lint'
alias ttest='npm run test'
alias ccoverage='npm run coverage'
alias gogo='cd ~/go/src/github.com/aimenhamed'
alias tnode='npx ts-node'
alias trun='npx esno'
alias pg='docker run --rm -itd --name postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydb -p 5432:5432 postgres'
alias pgl='psql -U postgres -d mydb -h 0.0.0.0'
alias ddb='docker run --rm -d --name dragonflydb -p 6379:6379 --ulimit memlock=-1 docker.dragonflydb.io/dragonflydb/dragonfly'
alias gor='go run cmd/main.go'

# navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias repos='cd ~/code'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push -u origin HEAD'
alias stat='git status'  
alias tag='git tag'
alias newtag='git tag -a'
alias add='git add'
alias stash='git stash'
alias merge='git merge'

# other
alias zshrc='vim ~/.zshrc'
alias q="exit"
alias jrun="java -jar"

### Functions ###

mkcd () {
    mkdir -p $1
    cd $1
}

runsh () {
    chmod 755 *.sh
    if test $? -eq 0
    then
        echo -e Shell scripts now executable
    else
        echo ""
        echo "No shell scripts found."
    fi
}

runpl () {
    chmod 755 *.pl
    if test $? -eq 0
    then
        echo -e Perl scripts now executable
    else
        echo ""
        echo "No perl scripts found." 
    fi
}

sshkey () {
    cat ~/.ssh/id_ed25519.pub
}

jr () {
    java -jar $1
}

prune () {
    docker system prune -a -f; docker volume prune -f
}

ports () {
  out=$(sudo lsof -i :$1)
  if [[ $out ]]; then
    echo "$out"
    list=$(echo "$out" | awk 'NR>1 {print $2}')
    echo "\nTerminate via kill -9 $list"
  else
    echo "No ports on $1"
  fi
}

kr() {
  kotlin_file="$1"
  jar="main.jar"

  if [ "$#" -eq 2 ]; then
    jar="$2"
  fi

  kotlinc "$kotlin_file" -include-runtime -d "$jar"

  if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the JAR..."
    java -jar "$jar"
  else
    echo "Compilation failed."
  fi
}
plugins=(git)

source $ZSH/oh-my-zsh.sh
