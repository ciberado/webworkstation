FROM tsl0922/ttyd

LABEL mantainer="Javi Moreno <javi.moreno@capside.com>"

COPY install.sh install.sh
RUN sh install.sh
    
EXPOSE 8080


ADD https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf /root/
COPY attach.sh /usr/bin/attach
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
CMD []

# ./ttyd -p 8080 -t fontSize=32 docker run -it --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock ubuntu
# ./ttyd -p 8080 -t fontSize=32 docker run -it --rm --privileged --net host
