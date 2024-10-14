# nestjs-tzmall
商城的后台api项目，前端项目：

## 本地开发启动
依赖服务：
```
// MySql服务
docker compose  --env-file .env.development run -d --service-ports mysql
// Redis服务
docker compose  --env-file .env.development run -d --service-ports redis
```

项目启动，首次启动前安装依赖包：
```
pnpm install
```

启动
```
pnpm dev
```
