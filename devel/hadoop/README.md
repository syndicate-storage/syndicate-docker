# H-Syndicate Docker Image for Hadoop

Build a Docker Image
--------------------

Make sure that you install docker and have access rights to run docker before get started.

Run `make` to start building a docker image.
```
sudo make build UG_HTTP_PORT=`portnum`
```

A new docker image for Syndicate Gateway will have a name "syndicate-hadoop" by default. The docker image created will have Syndicate installed and an user "syndicate".

You can run the image in interactive mode by following command.
```
sudo docker run -t -i syndicate-hadoop
```

