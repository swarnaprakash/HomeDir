export EDITOR=vim
export PAGER=less

# emacs editing mode
bindkey -e 

# The program 'X' is currently not installed. You can install it by typing ...
if [ -f /etc/zsh_command_not_found ];then
    source /etc/zsh_command_not_found
fi

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
DIRSTACKSIZE=16 # keeps the directory stack from getting too large

setopt autocd # type '<dir>' instead of 'cd <dir>'
setopt extendedglob # http://zsh.sourceforge.net/Intro/intro_2.html#SEC2
setopt nobeep
setopt interactivecomments # allow comments on cmd line
setopt nohup    # Don't HUP running jobs on logout
setopt notify # Report the status of background jobs immediately
setopt promptsubst # expansion performed in prompt

setopt hist_ignore_all_dups #No dups
setopt hist_ignore_space # Don't record if cmd preceded with space
setopt inc_append_history # new history lines are added as soon as they are entered
setopt banghist # Allow ! for accessing history 

setopt autopushd # cd acts like pushd
setopt pushdminus # swap cd +1 and cd -1
setopt pushdsilent 
setopt pushdtohome

setopt prompt_subst

#watch for logins
watch=(notme root)

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' users resolve
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 2 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' ambiguous true
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

autoload -Uz colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{28}+'
zstyle ':vcs_info:*' unstagedstr '%F{11}*'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats " [%b|%a%u%c]"
zstyle ':vcs_info:*' formats  " [%b%u%c]"
zstyle ':vcs_info:*' enable git

precmd () {
    vcs_info
}

# Escape URL while pasting/typing in terminal
unfunction url-quote-magic >& /dev/null
if autoload +X url-quote-magic 2> /dev/null; then
    # we successfully loaded the url-quote-magic function
    zle -N self-insert url-quote-magic
fi

export PS1='[%B%* %n@%M %d%b]%{$fg[yellow]%}${vcs_info_msg_0_}%{$fg[red]%}%(?.. (%?%))%{$reset_color%}
$'

#command aliases {{{
alias ls='ls --classify --color=auto'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'

alias gcc='gcc -lm -W -Wall -Wextra -O2'
alias g++='g++ -W -Wall -Wextra -O2'
#}}}

HIGHLIGHT=`echo -e '\033[41m\033[1;33m'`
NORMAL=`echo -e '\033[0m'`

highlight() {
   sed -e "s/$1/$HIGHLIGHT&$NORMAL/g"
}

ihighlight() {
   sed -e "s/$1/$HIGHLIGHT&$NORMAL/gi"
}

# print a range of lines from a file
middle () {
  sed -n -e $1','$2'p;'$2'q' $3
}
