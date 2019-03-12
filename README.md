# Propopulated web workstation

Uses [ttyd](https://github.com/tsl0922/ttyd) to provide a web-based terminal with the following tools:

* docker client
* git
* aws cli
* kops
* eksctl + aws-authenticator
* kubectl

## Running


```bash
docker run -p 8080:7681 --rm --restart=always ciberado/webworkstation:latest
```

## Connecting

Any user can open with their browser the port 8080 and login using one of the pre-created users (`student1`, `student2`, ..., `student25`). The password is `1234`. Please, ensure correct firewall rules are in place to avoid unwanted access.

After login, any student can (and should) open [tmux](https://github.com/tmux/tmux/wiki) by executing `attach` (it will create a new session or attach to an existing one).

To provide assistance users can switch between all sessions by pressing `ctrl`+`b` and then `s`.

It's important to understand users are going to be able to open root windows just by creating a new pan (the session is owned by the root user). Encourage them to use `su student<number>` command after that event.
