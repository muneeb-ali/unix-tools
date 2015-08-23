Docker
====
> boot2docker ip
> docker run -it —entrypoint=/bin/bash <docker_name>
> docker run -d muneeb/apache /usr/sbin/apache2ctl -D FOREGROUND

remove all stopped containers
> docker rm $(docker ps -a -q)

remove untagged image
> docker rmi $(docker images | grep "^<none>" | awk '{print $3}')

attach to a container 
> docker attach --sig-proxy=false <name>  #then Ctl+C works

Install on Ubuntu
>sudo apt-get update
> sudo apt-get install -y docker.io
> . ~/.bashrc #reload bash

build without using cached images
> docker build --no-cache=true .

Docker OS X timing issue
> /usr/local/bin/boot2docker ssh sudo ntpclient -s -h pool.ntp.org
