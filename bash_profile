#!/bin/bash

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -d $HOME/.bash_completion.d ] ; then
  for i in $HOME/.bash_completion.d/* ; do
    source $i
  done
fi

if [ -d /usr/local/etc/bash_completion.d ] ; then
  for i in /usr/local/etc/bash_completion.d/* ; do
    source $i
  done
fi

if [ -f /usr/local/etc/bash_completion ] ; then
    source /usr/local/etc/bash_completion
fi

if [ ! -n "$(type -t brew)" ] ; then
  if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
  fi
fi

# set -o vi

export LANG="en_US.UTF-8"
export EDITOR="vim"

alias ls='ls -G'

# RUBY

alias rspec="bundle exec rspec"
alias rake="bundle exec rake"

function __join {
  local IFS="$1"; shift; echo "$*"
}

function __promptline_cwd {
  local dir_limit=3
  local truncation="⋯ "
  local fake_root="/"
  local formatted_cwd=""
  local dir_sep="/"
  local tilde="~"
  local start=${1-$PWD}
  local cwd=""

  if [[ $start == $HOME/dev/*/* ]]; then
    cwd="${start/#$HOME\/dev\//}"
    cwd="${cwd#*/}"
    fake_root="${cwd%%/*}"
  else
    cwd="${start/#$HOME/$tilde}"

    if [[ "${cwd::1}" == "~" ]] ; then
      fake_root="~"
    fi
  fi

  cwd="${cwd/#$fake_root/}"
  cwd="${cwd/#\//}"

  IFS='/' read -r -a array <<< "$cwd"

  local limit=$dir_limit+1
  local joinable=()

  if [[ ${#array[@]} -gt $limit ]]; then
    fake_root="$fake_root/$truncation"
    joinable=("$fake_root" "${array[@]: -$dir_limit:$dir_limit}")
  else
    joinable=("$fake_root" "${array[@]}")
  fi

  formatted_cwd=$(__join $dir_sep "${joinable[@]}")

  printf "%s" "${formatted_cwd/#\/\///}"
  return
}

#
# Command Prompt
#

function _ssh_prompt() {
  if [[ "$SSH_CLIENT" != "" ]]; then
      printf "%s" "\u@\h 👾"
  fi
}

function _docker_prompt() {
  if [[ "$DOCKER_HOST" != "" ]]; then
    printf "%s" "🐳"
  fi
}

function _exit_status() {
  if [[ "$1" != "0" ]] ; then
    printf "%s" "💩"
  fi

}

# PROMPT=$'%n%{\e[0;38m%]}@%{\e[01;34m%]}%m%{\e[0;37m%]}:%{\e[1;37m%]}%~%{\e[0;37m%]}%{\e[0m%]}%(#.#.$) '
# PS1=$'%n@%m %B%{$fg[blue]%}%~ %{$fg[red]%}$(git_prompt_info)\$%{$reset_color%}%b '
# ➤ ⊗ ⊕ ➔ ➠ ➨ ➜ ✪ λ"
# ⁙ ⁖ ⁑ ⁐ ‣ ⁘ ⁛ ⁝ ⁞ ∴ ∷ ▒      
# PS1=$'$PROMPTHOST %B%{$fg[blue]%}%~%{$fg[red]%}\W$(__git_ps1 " (%s)" \W$(~/.rvm/bin/rvm-prompt)) %{$reset_color%}➔%b '
# PS1="$PROMPTHOST \[\033[1;34m\]\w\[\033[1;31m\]\$(git_prompt_info)\[\033[0m\] ➔ "

function __prompt_command() {
  local last_exit_code="$?"

  local reset="\[$(tput sgr0)\]"
  local blue_fg="\[$(tput setaf 4)\]"
  local red_fg="\[$(tput setaf 1)\]"
  local bold="\[$(tput bold)\]"

  local git_prompt=$(__git_ps1 "${red_fg}(%s) ")
  local left_side=($(_ssh_prompt) $(_docker_prompt) $(_exit_status $last_exit_code))

  local left_side_prompt=""
  [[ "$(__join "" ${left_side[*]})" != "" ]] && left_side_prompt="$(__join " " ${left_side[*]})  "

  PS1="${left_side_prompt}${bold}${blue_fg}$(__promptline_cwd)${git_prompt}${reset} ➜ "
  PS1="${left_side_prompt}${git_prompt}${bold}${blue_fg}$(__promptline_cwd)> ${reset}"

}

export PROMPT_COMMAND="__prompt_command${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

if [ ! -n "$(type -t update_terminal_cwd)" ]; then
  if [ -f /etc/bashrc_Apple_Terminal ] ; then
    source /etc/bashrc_Apple_Terminal
  fi
fi

# RBENV

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# SCALA

if [ -d /usr/local/opt/scala/libexec ]; then
  export SCALA_HOME=/usr/local/opt/scala/libexec
  PATH=$SCALA_HOME/bin:$PATH
fi

# JAVA

if [ -x /usr/libexec/java_home ] ; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

# PATH

PATH=$HOME/bin:$PATH:/usr/local/sbin

export PATH

# LOCAL

if [ -d $HOME/.bash_profile.d ] ; then
  for i in $HOME/.bash_profile.d/* ; do
    source $i
  done
fi
