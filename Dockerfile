FROM docker:17.05.0-ce

RUN apk add --update git openssh openjdk8-jre bash py-pip
RUN echo 'root:jenkins' | chpasswd
RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    ssh-keygen -A
RUN mkdir -p /opt/jenkins/workspace;
RUN pip install 'docker-compose'

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]