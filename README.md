# authsaur-docker

用于使用Docker运行您自己的authsaur的官方引导程序。

authsaur除了公开提供其源代码之外，还提供开箱即用地安装，我们选择使用 `Docker` 和 `Docker Compose` 以及基于 `bash` 的安装和升级脚本。

## Requirements
- Docker 23.0.6+
- Docker Compose 1.25.0+
- 2 CPU Cores
- 4 GB RAM

## 端口说明
### 外部端口(防火墙开放)
- 80、443：authsaur
- 8000：authsaur dashboard

### 内置端口
- 8080、8443：authsaur server
- 8787：authsaur admin api
- 3306：mysql
- 6379：redis

## 安装
1. 我们的建议总是下载最新版本的代码仓库：
```shell
git clone https://github.com/authsaur/authsaur-docker.git
```

2. 然后配置环境变量，可用的键在 `.env` 中定义，通常需要修改IP为本机IP地址：
```bash
# 访问IP地址
AUTHSAUR_IP=127.0.0.1
# 是否开启SSL，可选值：http或https
SSL=http
```

3. 在此目录中运行`sudo sh install.sh`进行安装，该脚本将处理您开始所需的所有事情。

4. 最后运行`docker-compose up -d`启动authsaur。您应该能够访问 http://127.0.0.1:8000 进入管理后台页面，访问 http://127.0.0.1 进入单点登录页面，默认账号密码为：`authsaur-admin/Mellon`。

> Authsaur要求Mysql、Redis优先启动，如果启动失败可以多次运行`docker-compose up -d`确保Authsaur启动完成。

## SSL配置
如果开启了SSL，需要替换`cert/authsaur.key`、`cert/authsaur.pem`为正确的证书。


