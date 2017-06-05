FROM docker:17.05.0-ce

RUN apk add --update git openssh openjdk8-jre bash
RUN echo 'root:jenkins' | chpasswd
RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    ssh-keygen -A
RUN mkdir -p /opt/jenkins/workspace;

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]