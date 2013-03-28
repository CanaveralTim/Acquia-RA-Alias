Acquia-RA-Alias
===============
WIP(Work-in-progress)-Alpha

These are the alias & shell commands from the RA Dash site

I named it .bash_profile, but that prevented bastion from working. .bashrc is suppossed to work when ssh'ing into unix. needs work

Add these two lines at the bottom of .profile or .bash_profile, which leaves the alias s.b to re-source this file if needed.
alias s.b="source ~/.bashrc"
s.b

The goal of this is to enter the info needed similar to RA Dash, then have shortcuts to most commonly used commands
Once these variables are setup, I will create shortcut to use Matt's functions with the clients variables.

Open a new iTerm tab, use "sn <sitename>"  (sitename also known as docroot)
And it will name the tab as well as set the $SITENAME variable
Working on making smoother...
