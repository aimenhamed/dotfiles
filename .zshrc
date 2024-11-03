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

# phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

### Aliases ###
alias vim='nvim'
alias vi='nvim'

alias so="source"
alias ninit='vi ~/.config/nvim/init.vim'
alias redis="docker run --rm -itd -p 6379:6379 --name redis redis"
alias mk="minikube"
alias untar="tar -xvf"

# development
alias tt='tmux attach-session'
alias lint='npm run lint'
alias ttest='npm run test'
alias ccoverage='npm run coverage'
alias gogo='cd ~/go/src/github.com/aimenhamed'
alias tnode='npx ts-node'
alias trun='npx esno'
alias pg='docker run --rm -itd --name postgres -e POSTGRES_PASSWORD=pass -e POSTGRES_DB=mydb -p 5432:5432 postgres'
alias pgl='psql -U postgres -d mydb -h 0.0.0.0'
alias ddb='docker run --rm -d --name dragonflydb -p 6379:6379 --ulimit memlock=-1 docker.dragonflydb.io/dragonflydb/dragonfly'
alias gor='go run cmd/main.go'

# navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias repos='cd ~/code'
alias samples='cd ~/Desktop/stuff/samples'
alias 2511='cd ~/uni/year3/t2/comp2511'
alias 3141='cd ~/uni/year3/t2/comp3141'
alias 3311='cd ~/uni/year3/t3/comp3311'
alias 3331='cd ~/uni/year3/t3/comp3331'
alias 4511='cd ~/uni/year3/t3/comp4511'

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

ytdl () {
    python3 /Users/aimen/code/ytdl/ytdl.py       
}

lsk () {
  java -jar /Users/aimen/repos/lsk/out/artifacts/untitled_jar/untitled.jar $1 $2
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
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/aimen/.ghcup/env" ] && source "/Users/aimen/.ghcup/env" # ghcup-env


# bun completions
[ -s "/Users/aimen/.bun/_bun" ] && source "/Users/aimen/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/aimen/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Deno 
export DENO_INSTALL="/Users/aimen/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
eval "$(fnm env --use-on-cd)"
# year4 t1
alias 3121='cd /Users/aimen/uni/year4/t1/comp3121'
alias 4920='cd /Users/aimen/uni/year4/t1/comp4920'

# pnpm
export PNPM_HOME="/Users/aimen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
pj() {
  CONFIG_PATH="$HOME/.pj.json"
  /usr/local/bin/pj "$@"
  if [ $# -eq 0 ]; then
    PATH_TO_CD=$(cat $CONFIG_PATH | jq -r ".last_opened")
    cd "$PATH_TO_CD"
  fi
}

pv() {
  CONFIG_PATH="$HOME/.pj.json"
  /usr/local/bin/pj "$@"
  if [ $# -eq 0 ]; then
    PATH_TO_CD=$(cat $CONFIG_PATH | jq -r ".last_opened")
    cd "$PATH_TO_CD"
  fi
  vi
}
export MODULAR_HOME="/Users/aimen/.modular"
export PATH="/Users/aimen/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CXX="/usr/local/opt/llvm/bin/clang++"


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# year4 term3
alias 6991='cd /Users/aimen/uni/year4/term3/comp6991'
alias 9414='cd /Users/aimen/uni/year4/term3/comp9414'
# year1 t3
alias 6991='cd /Users/aimen/uni/year1/t3/comp6991'
alias 9414='cd /Users/aimen/uni/year1/t3/comp9414'
