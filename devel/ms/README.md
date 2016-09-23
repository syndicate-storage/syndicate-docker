# Syndicate MS Docker Image

Build a Docker Image
--------------------

Make sure that you install docker and have access rights to run docker before get started.

Run `make` to start building a docker image.
```
sudo make MS_APP_ADMIN_EMAIL=`email-address` MS_HOST=`ip_address`
```

A new docker image for Syndicate MS will have a name "syndicate-ms" by default. The docker image created will have Syndicate installed and an user "syndicate".

You can run the image in interactive mode by following command.
```
docker run -t -i -p 8080:8080 -p 8000:8000 --name ms syndicate-ms
```

Also, you can open a terminal to the running image (container).
```
docker exec -i -t ms /bin/bash
```
