Dockerized version of the distribution available at https://imply.io/download.

[Install Docker](docker-install.md)

To build an image, first download the Imply distribution from the link above, place it in the cloned repository, and then run:

```
export implyversion=2.3.0
tar -xzf imply-$implyversion.tar.gz
docker build -t imply:$implyversion --build-arg IMPLY_VERSION=$implyversion .
```

To run the image in quickstart mode (single-machine, non-clustered):

```
docker run -p 8081-8110:8081-8110 -p 8200:8200 -p 9095:9095 -d --name imply imply:$implyversion
```

To load the example data:

```
docker exec -it imply bin/post-index-task -f quickstart/wikiticker-index.json
```

To enter the container, if you want:

```
docker exec -it imply /bin/bash
```

To stop the container:

```
docker stop imply
```
