################################################################################
#
#                            BSD 3-Clause License
#
#                        Copyright (c) 2018, wrightm-mac
#                            All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#
#  * Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
#  * Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
#  * Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
################################################################################

################################################################################
#                                                                              #
#                         ZSH Startup Script (c) 1997                          #
#                                                                              #
#                                -- LaForge --                                 #
#                                                                              #
################################################################################

# Temp directory...
export TEMPDIR=~/tmp
export TMP=$TEMPDIR
export TEMP=$TEMPDIR

# Directories...
export DESKTOP=~/Desktop
export DOCUMENTS=~/Documents
export DOWNLOADS=~/Downloads
export PUBLIC=~/Public
export SOURCE=~/Source

# The path...
PATH=$PUBLIC/bin:~/.cargo/bin:/usr/share/swift5.0/usr/bin:~/.local/bin:$PATH

# Shell extras...
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/rosalind.omp.json)"

# Standard colors for prompts...
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
export COLOR_PROMPT=yellow
export COLOR_GIT=green
export COLOR_HIGHLIGHT=red

# Set options for some commands...
export PAGER=/usr/bin/most
alias grep='grep --color=auto'
alias ls='ls -h --color=auto --group-directories-first'
export LS_COLORS='di=1;32:fi=00;97:ex=1;31:ln=target:or=4;31:*.pdf=1;37:*.sh=00;31:*.conf=00;32:*.log=00;36:*.proj=1;93:*.cs=0;93:*.py=00;93:*.ts=00;93:*.js=00;93:*.min.js=04;93:*.js.map=04;93:*.json=00;93:*.yml=00;93:*.yaml=00;93:*.htm=00;93:*.html=00;93:*.css=00;93:*.less=00;93:*.jade=00;93:*.md=0;93:*.jpg=0;36:*.jpeg=0;36:*.png=0;36:*.gif=0;36:*.svg=0;36:*.ico=0;36:*.txt=01;37:*.rtf=01;37:*.tar=4;93:*.zip=1;93:*.gz=1;93:*.deb=4;93:'
export LC_COLLATE='C'
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export RUST_BACKTRACE=1

# Prompt...
autoload -Uz colors && colors
autoload -Uz promptinit
promptinit
PROMPT=%B%F{$COLOR_PROMPT}%U$USERNAME%u%f:%b' '

# Git stuff...
source ~/.git-flow-completion.zsh
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=%B%F{$COLOR_GIT}\$vcs_info_msg_0_%f%b
zstyle ':vcs_info:git:*' formats '%b'
alias gitlog='git log --oneline --graph --decorate'

# Blurb...
echo $WHITE
figlet '   '$USERNAME
echo $YELLOW
fortune -a |cowsay -s

# Done...
echo
echo $RED'('`pwd`')'
echo
