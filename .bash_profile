export PATH=~/Drobox/Programming/bash/scripts:${PATH}
export PATH=/usr/texbin:${PATH}
export PATH=/usr/libexec/java_home:${PATH}
export PATH=/usr/local/bin/pylint:${PATH}
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:${PATH}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
