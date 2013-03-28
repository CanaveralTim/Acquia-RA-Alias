# Add these lines to the bottom of .profile or .bash_profile, which conveniently leaves the alias s.b to re-source this file if needed.
# alias s.b="source ~/<path>/.bashrc"
# s.b
#

#
# Personal Fix these & the daisy-chain calls at the bottom & (hopefully-beta) we're good to go.
#
FIRSTNAME="tim"
LASTNAME="mcneal"
RAINITIAL="TCM"
SVNPW="codepass11"
#  END Personal See bottom for file locations


#
# General 
#
alias ll="ls -la"
alias rmds="rm .DS_Store"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias back='cd $OLDPWD'
alias cdb='cd $OLDPWD'
alias cdt='cd trunk/'
#
# Other 
#
#SITENAME="~=~"
SVNNAME="acquia_ahsupport_$FIRSTNAME$LASTNAME"
ENV="prod"
#
#  Git 
#
alias gs="git status"
alias gcom="git checkout master"
alias gsgr="git status | grep rej"
alias gsgo="git status | grep orig"
alias gaa="git add -A"
alias gb="git branch"
alias gpa="git pull --all"
alias gp="git push"
alias gptom="git push --tags origin master"
#
# Subversion
#
alias ss="svn status"
alias ssgr="svn status --no-ignore | grep rej"
alias ssgo="svn status | grep orig"
alias sadd="svn status | grep '\?' | awk '{print $2}' | xargs svn add"
alias srm="svn status | grep \! | awk '{print $2}' | xargs svn rm"
alias si='svn info'
alias su='svn up'
alias ssm='svn switch ^/master'
alias sco="svn checkout --username $SVNNAME --password $SVNPW $VCSPATH"
#
# Misc Update related
#
alias cddr="cd docroot"
alias cdsc="cd ~/Sites/clients/"
alias rmvn="~/Sites/releases/version-patches/scripts/rmv-versionnums-dpl.sh"
alias mcd='mkdir $SITENAME && cd $SITENAME'

#
#   Wannabees
#


#
#  http://stackoverflow.com/questions/10311600/profile-file-linking


# == ==  == ==  == ==  == ==  == ==  == ==  == == 
#
# Functions
#
# == ==  == ==  == ==  == ==  == ==  == ==  == ==
# sitename: set the sitename const, set up handy aht alias using const & name the tab in iterm2 
function sn {
if [ -z "$1" ]
  then echo "missing client code, exiting" && return
fi
SITENAME="$1"
export PROMPT_COMMAND='echo -ne "\033]0;$SITENAME\007"'
alias ahst="aht @$SITENAME.prod --uri=default drush status"                         
alias ahsi="aht @$SITENAME.prod sites"                                             
alias ahsup="aht @$SITENAME.prod --uri=default drush upc --pipe --security-only"    
alias ahaup="aht @$SITENAME.prod --uri=default drush upc --pipe"                  
alias ahuli="aht @$SITENAME.prod --uri=default uli"                                
alias ahrepo="aht @$SITENAME.prod repo"                                             
}

# tab: name the tab in iterm2 
function tab {
if [ -z "$1" ]
  then echo "missing tab name, exiting" && return
fi
SITENAME="$1"
export PROMPT_COMMAND='echo -ne "\033]0;$SITENAME\007"'
}

# find module: Finds the folders where modules live
# *#*#*#*#  Notice default raised to 1000(need to if-else this) - In need of some TLC RegEx magic  *#*#*#*# 
function fmod {
if [ -z "$1" ]
  then echo "missing module name, exiting" && return
fi
if [ -z "$2" ]
  then FMODNUM=1000
  else FMODNUM="$2"
fi
find . -type d | grep -i "$1" | head -$FMODNUM
}

# check pressflow, allows changing env option and uses SITENAME
function cpf { 
if [ -z "$1" ]
  then RAENV="prod"
  else RAENV="$1"
fi
  dvcheck @$SITENAME.$RAENV
#  aht @$SITENAME.$RAENV drush php-eval 'echo (function_exists("drupal_page_cache_header_external") ? "Pressflow" : "Drupal") . " " . VERSION . "\n";'; 
}


# VCS: store the path of the VCS 
function vcs {
if [ -z "$1" ]
  then echo "missing VCS path, exiting" && return
fi
VCSPATH="$1"
echo $VCSPATH
}

# ENV: store the environment for the workflow & aht commands
function env {
if [ -z "$1" ]
  then echo "missing environment name, i.e prod, stag, dev, qa, etc, exiting" && return
fi
ENV="$1"
echo $ENV
}

# vars: print the vars that are needed for smooth ops
function vars {
echo "Welcome to RA~Land"
echo "SITENAME "$SITENAME 
echo "FIRSTNAME" $FIRSTNAME
echo "LASTNAME" $LASTNAME
echo "RAINITIAL " $RAINITIAL
echo "VCSPATH " $VCSPATH
echo "ENV "$ENV
echo "SVNNAME "$SVNNAME
echo "SVNpw "$SVNPW
}

# ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~ 
# Fix these for your personal preferences
# ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~  ~ ~ ~ 
alias s.m="source ~/.Tim/.matt.20130325.bash_profile"
s.m

alias s.t="source ~/.Tim/Acquia-RA-Alias/.tim"
s.t

alias s.x="source ~/.Tim/Acquia-RA-Alias/.test"
s.x

