# If not runnning interactively, don't do anythin
[[ $- ==*i* ]] || return

[ -n "$PS1" ] && source ~/.bash_profile;
