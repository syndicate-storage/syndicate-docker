# Syndicate Gateway Docker Image

Build a Docker Image
--------------------

Make sure that you install docker and have access rights to run docker before get started.

Run `make` to start building a docker image.
```
make
```

A new docker image for Syndicate Gateway will have a name `syndicate-docker-gateways` by default. The docker image created will have Syndicate installed and an user `syndicate`.

You can run the image in interactive mode by following command.
```
docker run -t -i -p 31111:31111 --name ug syndicate-docker-gateways
```

If you are going to use `syndicatefs`, you would need to give higher privilege when running docker container.
```
docker run -t -i -p 31111:31111 --cap-add SYS_ADMIN --device /dev/fuse --privileged --name ug syndicate-docker-gateways
```
