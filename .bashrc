# ~/.bashrc used only in interactive mode
case $- in
    *i*) ;;
      *) return;;
esac


# Environment variable
[ -d /opt/dell/srvadmin/bin ] && export PATH=$PATH:/opt/dell/srvadmin/bin
export CLICOLOR=1
export LSCOLORS=exgxcxdxbxexexabagacad
export EDITOR="vim"
export TERM="xterm-256color"
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=200000
export HISTSIZE=10000
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS='-F -i -J -M -R -W -x4 -X -z-4'


# Allows you to use less to visualize the archives
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Define the terminal prompt
export PROMPT_COMMAND=set_prompt

set_prompt() {
    # Capture exit code of last command
    local ex=$?
    #----------------------------------------------------------------------------#
    # Bash text colour specification:  \e[<STYLE>;<COLOUR>m
    # (Note: \e = \033 (oct) = \x1b (hex) = 27 (dec) = "Escape")
    # Styles:  0=normal, 1=bold, 2=dimmed, 4=underlined, 7=highlighted
    # Colours: 31=red, 32=green, 33=yellow, 34=blue, 35=purple, 36=cyan, 37=white
    #----------------------------------------------------------------------------#
    local color_red='\e[1;31m'
    local color_green='\e[1;32m'
    local color_blue='\e[1;34m'
    local color_purple='\e[1;35m'
    local color_cyan='\e[1;36m'
    local color_white='\e[1;37m'
    local color_brown='\e[1;33m'
    local reset='\e[0m'

    # Set prompt content
    PS1="\u@\h:\w\[$reset\] "
    # Set colour of prompt
    if [[ $(id -u) == 0 ]]; then
	if [[ $ex == 0 ]]; then
	    PS1="\[$color_green\]\A \[$color_red\]\u\[$color_white\] @ \[$color_brown\]\h\[$reset\] :\[$color_blue\]\w \[$reset\]λ "
	else
	    PS1="\[$color_red\]\A \[$color_red\]\u\[$color_white\] @ \[$color_brown\]\h\[$reset\] :\[$color_blue\]\w \[$reset\]λ "
	fi
    else
	if [[ $ex == 0 ]]; then
	    PS1="\[$color_green\]\A \[$color_purple\]\u\[$color_white\] @ \[$color_brown\]\h\[$reset\] :\[$color_blue\]\w \[$reset\]λ "
	else
	    PS1="\[$color_red\]\A \[$color_purple\]\u\[$color_white\] @ \[$color_brown\]\h\[$reset\] :\[$color_blue\]\w \[$reset\]λ "
	fi
    fi
}

# Define colored aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Colors GCC compiler errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# some more ls aliases
alias ll='ls -ltrah --group-directories-first'
alias la='ls -lAh --group-directories-first'
alias l='ls -lah --group-directories-first'


# If the file ~/.bash_aliases exists, it interprets it
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Enables autocompletion if available
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Vim plugin for decrypting GPG files
export GPG_TTY=`tty`


init_shopt ()	{
	# Minor errors in the spelling of a directory component of a cd command will be fixed.
	shopt -s cdspell
	# The extended pattern comparison functions are enabled - ex: ?(pattern-list).
	shopt -s extglob
	# Bash checks that a command found in the hash table exists before trying to execute it.
	shopt -s checkhash
	# Updates the terminal size after each order.
	shopt -s checkwinsize
	# The ** pattern is used to expand one or more directories.
	shopt -s globstar
	# Shell error messages are written in the standard gnu error message format.
	shopt -s gnu_errfmt
	# Lines beginning with '#' are ignored in an interactive shell.
	shopt -s interactive_comments
	# If Readline is used, Bash will not try to search the PATH for possible completions when trying to fill it on an empty line.
	shopt -s no_empty_cmd_completion
	# Bash matches the patterns case-sensitively when executing the comparison when executing a case or conditional command.
	shopt -s nocasematch
	# The history list is added to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
	shopt -s histappend
	}

mkcd () {
		mkdir $1
		cd $1
	}

function extract() {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1   ;;
			*.tar.gz)  tar xvzf $1   ;;
			 *.bz2)    bunzip2 $1    ;;
			*.rar)     unrar x $1    ;;
			*.gz)      gunzip $1     ;;
			*.tar)     tar xvf $1    ;;
			*.tbz2)    tar xvjf $1   ;;
			*.tgz)     tar xvzf $1   ;;
			*.zip)     unzip $1      ;;
			*.Z)       uncompress $1 ;;
			*.7z)      7z x $1       ;;
			*) echo "Don't know how to extract '$1'" ;;
		esac
	else
		echo "Error '$1' is not a valid file"
	fi
}

init_shopt
