# Syndicate Docker Image for Hadoop

Build a Docker Image
--------------------

Make sure that you install docker and have access rights to run docker before get started.

Run `make` to start building a docker image.
```
make
```

A new docker image for Syndicate Gateway will have a name "syndicate-gateways-hadoop-dev" by default. The docker image created will have Syndicate installed and an user "syndicate".

You can run the image in interactive mode by following command.
```
docker run -t -i -p 31111:31111 -p 8888:8888 --name ug-hadoop syndicate-gateways-hadoop-dev
```
