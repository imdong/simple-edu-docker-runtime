#!/bin/bash

# 启动容器
docker compose up -d

# 初始化安装依赖包
docker compose exec php73 composer install
docker compose exec php82 composer install

source .env

# 安装配置文件
cat>./SimpleEduBackend/.env <<<END
DB_HOST=postgres
DB_DATABASE=simple_edu
DB_USERNAME=postgres
DB_PASSWORD="${POSTGRES_PASSWORD}"
END

cat>./SimpleEduSystem/.env <<<END
DB_HOST=postgres
DB_DATABASE=simple_edu
DB_USERNAME=postgres
DB_PASSWORD="${POSTGRES_PASSWORD}"
END

# 安装数据库
docker compose exec php73 ./init.sh
docker compose exec php82 ./init.sh
