# ASFcn 

[![docker](https://github.com/sffxzzp/ASFcn/actions/workflows/docker.yml/badge.svg)](https://github.com/sffxzzp/ASFcn/actions/workflows/docker.yml) [![Docker Pulls](https://badgen.net/docker/pulls/sffxzzp/asfcn?icon=docker&label=pulls)](https://hub.docker.com/r/sffxzzp/asfcn/)

[ArchiSteamFarm](https://github.com/JustArchiNET/ArchiSteamFarm)（简称为 ASF），但使用 [Caddy](https://caddyserver.com/) 作为 Steam 社区的反代，自动生成并信任根证书。

## 用法

### 提前准备

新建一个目录，用于保存 `config` 和 `logs` 目录。

之后执行代码即可。

**默认 IPC 密码为：`asfcnasfcn`**

### Docker 仓库

由 GitHub Actions 推送至 Docker Hub、GitHub Container Registry 以及阿里云容器镜像服务，拉取时可互相替换。

```
sffxzzp/asfcn:latest
ghcr.io/sffxzzp/asfcn:latest
registry.cn-hangzhou.aliyuncs.com/sffxzzp/asfcn:latest
```

### 运行

参数中，`-d` 是保持后台，`--name` 是镜像名称，用于此后的管理，`-p` 后面是端口映射，两个 `-v` 是目录对宿主机的映射

皆可按需自行修改

------

使用在线镜像，保持程序在后台运行：

``` shell
docker run -d --name asf -p 1242:1242 -v $PWD/config:/app/config -v $PWD/logs:/app/logs sffxzzp/asfcn:latest
```

或者，在前台运行（可以开个 screen，然后运行）：

``` shell
docker run -it --name asf -p 1242:1242 -v $PWD/config:/app/config -v $PWD/logs:/app/logs --rm sffxzzp/asfcn:latest
```

或者，克隆仓库后用 `Dockerfile` 自行构建镜像（可省略，省略后会自动拉取在线仓库）：

``` shell
docker build -t sffxzzp/asfcn:latest .
```

### 运行之后

如果需要前置 nginx 的话，可以用 `-p 127.0.0.1:1242:1242`，使其只允许本机访问。

第一次运行，会自动在 `config` 目录下创建 `ASF.json` 以及 `IPC.config`，以确保启动之后可以直接使用 IPC。

运行之后，将 ASF 的各种配置文件放入 `config` 目录即可。
