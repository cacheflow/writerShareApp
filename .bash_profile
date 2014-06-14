source ~/.git-prompt.sh
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

#shell prompt example
PS1='\u $(__git_ps1 "(%s)")\$ '


export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH




