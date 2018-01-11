#!/bin/bash

if [ -n "${DOCKER_REGISTRY_HOST}" ] && [ -n "${DOCKER_REGISTRY_USERNAME}" ] && [ -n "${DOCKER_REGISTRY_PASSWORD}" ]
then
    docker login -u ${DOCKER_REGISTRY_USERNAME} -p ${DOCKER_REGISTRY_PASSWORD} ${DOCKER_REGISTRY_HOST}
fi

/usr/sbin/sshd -D