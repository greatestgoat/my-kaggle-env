# gcloud setting
```
gcloud compute ssh cloud-user@myinstance-1 --ssh-key-file ~/.ssh/id_rsa

# GCPのインスタンスに接続できたら一旦exit
exit
```

```
touch ~/.ssh/config
chmod 600 ~/.ssh/config
```

```
vi ~/.ssh/config

Host <Host名>
    HostName <インスタンスの外部IPアドレス>
    User cloud-user # `gcloud compute ssh`でログインしたときのユーザ名
```

接続確認
```
ssh <Host>
```

接続確認が終了したらvscodeでリモート接続する

インスタンスの8888ポートとローカルの28888でポートフォワーディングする

これを行うことでインスタンスで立ち上げたJupyterにつなぎに行ける
```
gcloud beta compute  --project "project" ssh --zone  "Zone" "instance" -- -N -f -L 28888:localhost:8888
```

# docker
vscodeでインスタンスに接続後に以下コマンドでセットアップを行う
```
docker build ./ -t {image name}

docker run --runtime=nvidia -p 8888:8888 -d -v ~/project:/root/user/project --name test tag /sbin/init

docker run -p 8888:8888 -d -v ~/project:/root/user/project --name test tag /sbin/init
```

コンテナ内の作業
```
#コンテナに入る
docker exec -it test /bin/bash

cd project
mkdir code data
jupyter notebook --ip=0.0.0.0 --allow-root
```