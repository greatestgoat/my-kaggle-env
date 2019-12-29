gcloud setting
```
 gcloud beta compute  --project "project" ssh --zone  "Zone" "instance" -- -N -f -L 28888:localhost:8888
```

docker
```
docker build ./ -t {image name}

docker run --runtime=nvidia -p 8888:8888 -d -v ~/project:/root/user/project --name test instance_name /sbin/init

```

コンテナ内の作業
```
#コンテナに入る
docker exec -it test /bin/bash

cd project
mkdir code data
jupyter notebook --ip=0.0.0.0 --allow-root
```