#/bin/sh

tmux -S /tmp/course new -d -s trainer
chgrp students /tmp/course
chmod 777 /tmp/course


ttyd -t fontSize=24 login
