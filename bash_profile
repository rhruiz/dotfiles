
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

# set -o vi

export LANG="en_US.UTF-8"
export EDITOR="vim"

alias ls='ls -G'

# RUBY

alias rspec="bundle exec rspec"
alias rake="bundle exec rake"

# GIT

git_prompt_info() {
  __git_ps1
  # DEPTH=$( pwd | sed 's/[^\/]//g' )
  # if [[ ${#DEPTH} -ge 3 ]] ; then
  #   git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\/\(.*\)/ (\1)/' 2> /dev/null
  # fi
}

function __promptline_vcs_branch {
  local branch
  # git
  if hash git 2>/dev/null; then
    if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null ); then
      branch=${branch##*/}
      printf "(%s)" "${branch:-unknown}"
      return
    fi
  fi
  return 1
}

function __promptline_cwd {
  local dir_limit="3"
  local truncation="⋯ "
  local first_char
  local part_count=0
  local formatted_cwd=""
  local dir_sep="/"
  local tilde="~"

  local cwd="${PWD/#$HOME/$tilde}"

  # get first char of the path, i.e. tilde or slash
  [[ -n ${ZSH_VERSION-} ]] && first_char=$cwd[1,1] || first_char=${cwd::1}

  # remove leading tilde
  cwd="${cwd#\~}"

  while [[ "$cwd" == */* && "$cwd" != "/" ]]; do
    # pop off last part of cwd
    local part="${cwd##*/}"
    cwd="${cwd%/*}"

    formatted_cwd="$dir_sep$part$formatted_cwd"
    part_count=$((part_count+1))

    [[ $part_count -eq $dir_limit ]] && first_char="$truncation" && break
  done

  printf "%s" "$first_char$formatted_cwd"
}

#
# Command Prompt
#

function _ssh_prompt() {
  if [[ "$SSH_CLIENT" != "" ]]; then
      printf "%s" "\u@\h 👾 "
  fi
}

function _docker_prompt() {
  if [[ "$DOCKER_HOST" != "" ]]; then
    printf "%s" " 🐳 "
  fi
}

function _exit_status() {
  if [[ "$1" != "0" ]] ; then
    printf "%s" " 💩 "
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

  local git_prompt=$(__promptline_vcs_branch)

  if [[ "${git_prompt}" == "" ]]; then
    GIT_PROMPT=""
  else
    GIT_PROMPT="\[$(tput setaf 1)\] ${git_prompt}"
  fi

  local left_side="$(_ssh_prompt)$(_docker_prompt)$(_exit_status $last_exit_code)"

  if [[ "$left_side" != "" ]]; then
    left_side="${left_side} "
  fi

  PS1="${left_side}${bold}${blue_fg}$(__promptline_cwd)${GIT_PROMPT}${reset} ➜ "

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
