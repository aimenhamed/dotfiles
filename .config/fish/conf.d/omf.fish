# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message

### Aliases ###

alias vim=nvim

# navigation
#
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

### Functions ###

function mkcd
  mkdir -p $argv[1]
  cd $argv[1]
end

function sshkey
  cat ~/.ssh/id_rsa.pub
end

function runsh
  chmod 755 *.sh
  if test $status -eq 0
    echo -e Shell scripts now executable
  else
    echo ""
    echo "No shell scripts found."
  end
end

function runpl
  chmod 755 *.pl
  if test $status -eq 0
    echo -e Perl scripts now executable
  else
    echo ""
    echo "No perl scripts found."
  end
end

function runfish
  chmod 755 *.fish
  if test $status -eq 0
    echo -e Fish scripts now executable
  else
    echo ""
    echo "No fish scripts found."
  end
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
