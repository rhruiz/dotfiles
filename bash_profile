
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

#
# Command Prompt
#

if [[ "$SSH_CLIENT" != "" ]]; then
    PROMPTHOST="\u@\h 👾 "
else
    PROMPTHOST=""
fi

# PROMPT=$'%n%{\e[0;38m%]}@%{\e[01;34m%]}%m%{\e[0;37m%]}:%{\e[1;37m%]}%~%{\e[0;37m%]}%{\e[0m%]}%(#.#.$) '
# PS1=$'%n@%m %B%{$fg[blue]%}%~ %{$fg[red]%}$(git_prompt_info)\$%{$reset_color%}%b '
# ➤ ⊗ ⊕ ➔ ➠ ➨ ➜ ✪ λ"
# PS1=$'$PROMPTHOST %B%{$fg[blue]%}%~%{$fg[red]%}\W$(__git_ps1 " (%s)" \W$(~/.rvm/bin/rvm-prompt)) %{$reset_color%}➔%b '
# PS1="$PROMPTHOST \[\033[1;34m\]\w\[\033[1;31m\]\$(git_prompt_info)\[\033[0m\] ➔ "

function __prompt_command() {
  local EXIT="$?"

  if [[ $EXIT != 0 ]] ; then
    EXIT=" 💩 "
  else
    EXIT=""
  fi

  PS1="$PROMPTHOST \[\033[1;34m\]\w\[\033[1;31m\]\$(git_prompt_info)\[\033[0m\]$EXIT ➜ "

  update_terminal_cwd; update_terminal_cwd
}

export PROMPT_COMMAND=__prompt_command

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
