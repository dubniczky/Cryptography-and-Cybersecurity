# Test
docker pull hello-world
docker run --rm hello-world

docker image ls
docker ps
docker ps -a
dcker rm <container_id>

# Interactive shell
docker pull ubuntu
docker run -it --rm --entrypoint /bin/bash ubuntu # image name is after the last argument!
