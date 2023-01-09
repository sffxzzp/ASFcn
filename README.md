# ASFcn

ArchiSteamFarm，但使用 Caddy 作为 Steam 社区的反代，自动生成并信任根证书。

## 用法

后台运行

``` shell
docker run -d --name asf -p 1242:1242 -v ~/asf/config:/app/config -v ~/asf/logs:/app/logs gchr.io/sffxzzp/asfcn:latest
```

或，自行构建

``` shell
docker build -t ghcr.io/sffxzzp/asfcn:latest .
```
