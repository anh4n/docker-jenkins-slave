FROM docker:17.05.0-ce

RUN apk add --update git openssh openjdk8-jre
RUN set -x ; \
  addgroup -g 1000 -S jenkins ; \
  adduser -u 1000 -s /bin/sh -D -S -G jenkins jenkins ; \
  echo 'jenkins:jenkins' | chpasswd ; \
  ssh-keygen -A

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]