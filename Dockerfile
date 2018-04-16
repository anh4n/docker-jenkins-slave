FROM docker:18.03.0-ce

ENV DOCKER_COMPOSE_VERSION=1.20.1

RUN apk add --update git openssh openjdk8-jre bash py-pip \
    && echo 'root:jenkins' | chpasswd \
    && sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && ssh-keygen -A \
    && mkdir -p /opt/jenkins;

RUN pip install 'docker-compose'==${DOCKER_COMPOSE_VERSION}

COPY start.sh /root/start.sh

EXPOSE 22

CMD ["/root/start.sh"]
