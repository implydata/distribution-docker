To build an image:

```
docker build -t imply:1.0.0 .
```

To run the image:

```
docker run -p 1527:1527 -p 2181:2181 -p 8081-8110:8081-8110 -p 9095:9095 -d --name imply imply:1.0.0
```

To load the example data:

```
docker exec -it imply /root/imply-1.0.0/bin/post-index-task -f /root/imply-1.0.0/quickstart/wikiticker-index.json
```

To enter the container, if you want:

```
docker exec -it imply /bin/bash
```

To kill the container:

```
docker kill imply
```