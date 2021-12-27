#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# The bash process identifier
BASH_PID=$(echo $$)

# Returns the exit code of last process executed
function last_process_status {
  echo $?
}

# counts how many process are currently running in the system
function process_running {
  ps -uax | grep -v "grep" --count
}

# will only show when in a directory that is a git repository
function git_content {
  git status 1>/dev/null 2>&1 
  if [ $? -eq 0 ]; then
    # there is a git repository
    local branch 
    branch=$(git branch --show-current)
    echo -e "\nCurrent Branch: \033[1;36m${branch}\033[0m"
  else 
    # does nothing
    echo ""
  fi
}

# Just add the SSH environment variables and then add the default ssh key to the bash session
function load_ssh_key {
  # Eval will evaluate the stdout of ssh-agent(will create the SSH environment variables
  eval $(ssh-agent) 1>/dev/null

  # Adds the default key to the bash session
  ssh-add
}

alias reload_bash="source ~/.bashrc"
alias add_ssh_key_to_session="load_ssh_key"
alias ip="ip --color=auto"
alias ls="ls --color=auto"

# The command prompt
PS1='\[\033[1;36m\[[\d \@]\[\033[0;31m\] \[\033[0;31m\]\u\[\033[0m\] at box \[\033[0;31m\]\h\[\033[0m\] is in \[\033[0;31m\]\w\[\033[0m\].\nLast exit: \[\033[0;32m\]\[`last_process_status`\]\[\033[0m\] Running: \[\033[0;32m\]\[`process_running`\]\[\033[0m\] Bash PID: \[\033[0;32m\]\[$BASH_PID\]\[\033[0m\] Executed: \[\033[0;32m\]\#\[\033[0m\]\[`git_content`\]\n\$ '

# Does not store to history commands that begin with whitespace
HISTCONTROL=ignorespace

export PS1

