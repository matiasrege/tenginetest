# tenginetest

##Build
```bash
docker build -t tenginetest .
```

##Run
```bash
docker run -t -i -v `pwd`:/app tenginetest bash
```

##Test
Inside the container

```bash
/opt/nginx/sbin/nginx -c /app/nginx.conf

curl 127.0.0.1:8080/foo -v
```

