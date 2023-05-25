# ASFcn

ArchiSteamFarm（简称为 ASF），但使用 Caddy 作为 Steam 社区的反代，自动生成并信任根证书。

## 用法

### 提前准备

新建 `~/asf/` 目录，并于其下创建 `config` 和 `logs` 目录。

准备好 ASF 配置文件，放置于 `~/asf/config` 目录下即可。

### Docker 仓库

由 GitHub Actions 推送至 Docker Hub 和 GitHub Container Registry，拉取时可互相替换。

```
sffxzzp/asfcn:latest
ghcr.io/sffxzzp/asfcn:latest
```

### 运行

参数中，`-d` 是保持后台，`--name` 是镜像名称，用于此后的管理，`-p` 后面是端口映射，两个 `-v` 是目录对宿主机的映射

皆可按需自行修改

------

使用在线镜像，保持程序在后台运行：

``` shell
docker run -d --name asf -p 1242:1242 -v ~/asf/config:/app/config -v ~/asf/logs:/app/logs --rm sffxzzp/asfcn:latest
```

或者，在前台运行：

``` shell
docker run -it --name asf -p 1242:1242 -v ~/asf/config:/app/config -v ~/asf/logs:/app/logs --rm sffxzzp/asfcn:latest
```

或者，克隆仓库后用 `Dockerfile` 自行构建镜像（可省略，省略后会自动拉取在线仓库）：

``` shell
docker build -t sffxzzp/asfcn:latest .
```
