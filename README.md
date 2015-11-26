Dockerized version of the distribution in https://github.com/implydata/distribution.

To build an image:

```
docker build -t imply/imply:1.0.1 .
```

To run the image in quickstart mode (single-machine, non-clustered):

```
docker run -p 8081-8110:8081-8110 -p 9095:9095 -d --name imply imply/imply:1.0.1
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
