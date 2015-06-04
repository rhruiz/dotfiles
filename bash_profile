
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -d $HOME/.bash_completion.d ] ; then
    source $HOME/.bash_completion.d/*
fi

if [ -f /usr/local/etc/bash_completion ] ; then
    source /usr/local/etc/bash_completion
fi

if [ -d /usr/local/etc/bash_completion.d ] ; then
  for f in /usr/local/etc/bash_completion.d/*; do
    source $f
  done
fi

# set -o vi

export LANG="en_US.UTF-8"
PATH="$PATH:/usr/local/git/libexec/git-core"

export EDITOR="vim"
alias ls='ls -G'

# RUBY

alias rspec="bundle exec rspec"
alias rake="bundle exec rake"

# GIT
# brew install git
git_prompt_info() {
        __git_ps1
}

#
# Command Prompt
#

if [[ "$SSH_CLIENT" != "" ]]; then
    PROMPTHOST="\u@\h"
else
    PROMPTHOST=""
fi

# PROMPT=$'%n%{\e[0;38m%]}@%{\e[01;34m%]}%m%{\e[0;37m%]}:%{\e[1;37m%]}%~%{\e[0;37m%]}%{\e[0m%]}%(#.#.$) '
# PS1=$'%n@%m %B%{$fg[blue]%}%~ %{$fg[red]%}$(git_prompt_info)\$%{$reset_color%}%b '
# ➤ ⊗ ⊕ ➔ ➠ ➨ ➜ ✪
# PS1=$'$PROMPTHOST %B%{$fg[blue]%}%~%{$fg[red]%}\W$(__git_ps1 " (%s)" \W$(~/.rvm/bin/rvm-prompt)) %{$reset_color%}➔%b '

PS1="$PROMPTHOST \[\033[1;34m\]\w\[\033[1;31m\]\$(git_prompt_info)\[\033[0m\] ➔ "


# RBENV

if [ -d $HOME/.rbenv/shims ] ; then
  PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi


# READLINE

export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"

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

if [ -f $HOME/.bash_local.sh ] ; then
  source $HOME/.bash_local.sh
fi

