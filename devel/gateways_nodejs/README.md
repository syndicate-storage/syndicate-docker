# Syndicate Gateway Docker Image for Node.js

Build a Docker Image
--------------------

Make sure that you install docker and have access rights to run docker before get started.

Run `make` to start building a docker image.
```
sudo make build MS_APP_ADMIN_EMAIL=`email-address` MS_HOST=`ip_address` GATEWAY_PORT=`portnum`
```

A new docker image for Syndicate Gateway will have a name "syndicate-gateways-node" by default. The docker image created will have Syndicate installed and an user "syndicate".

You can run the image in interactive mode by following command.
```
sudo docker run -t -i -p 31111:31111 -p 8888:8888 --name ug-nodejs syndicate-gateways-node
```
