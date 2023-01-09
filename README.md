# ASFcn

ArchiSteamFarm，但使用 Caddy 作为 Steam 社区的反代，自动生成并信任根证书。

## 用法

`docker run -d --name asf -p 1242:1242 -v ./config:/app/config -v ./logs:/app/logs sffxzzp/ASFcn:latest`
