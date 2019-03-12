#/bin/sh

tmux -S /tmp/course attach -t $USER || tmux -S /tmp/course new -s $USER 'su '$USER
