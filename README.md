# anh4n/jenkins-docker-slave

Jenkins Slave running **docker**, **docker-compose** and ssh server  
This Image is **not** using docker-in-docker instead the hosts docker daemon is mounted.

## Jenkins Configuration

Field          | Value
-------------- | ------------
Remote FS root | /opt/jenkins
Launch method  | Launch slave agents on Unix machines via SSH

### Credentials

Username: `root`  
Password: `jenkin`

## Mounting volumes

If you want to mount directories in a build step e.g.:

    docker run --rm -v "$(pwd)":/data busybox ls -l /data

then the jenkins slave `Remote FS root` directory (/opt/jenkins) must exist on the host too. Otherwise the docker daemom can't find the mounted files.

## Login to private Docker Registry

At startup the Jenkins Slave can login to a Docker Registry.
Set the following environment variables in your `docker-compose` file or `docker run` command.

- DOCKER_REGISTRY_HOST
- DOCKER_REGISTRY_USERNAME
- DOCKER_REGISTRY_PASSWORD

## Example `docker-compose.yml` file

    version: '2'

    services:
        slave:
            image: anh4n/jenkins-docker-slave
            volumes:
                - /var/run/docker.sock:/var/run/docker.sock
                - /opt/jenkins:/opt/jenkins
            environment:
                - DOCKER_REGISTRY_HOST=myregistry.example.com
                - DOCKER_REGISTRY_USERNAME=myuser
                - DOCKER_REGISTRY_PASSWORD=mysecretpassword