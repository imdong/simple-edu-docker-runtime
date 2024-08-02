#!/bin/sh

# 初始化外部环境
init_docker() {

    # 先启动 postgres 预热
    docker compose up -d postgres

    # 加载配置
    source .env

    # 生成配置文件
    config="APP_KEY=\nAPP_ENV=local\n\nDB_HOST=postgres\nDB_DATABASE=simple_edu\nDB_USERNAME=postgres\nDB_PASSWORD=\"${POSTGRES_PASSWORD}\""

    echo $config >./SimpleEduBackend/.env
    echo $config >./SimpleEduSystem/.env

    # 使用临时容器安装各仓库需要的包
    docker compose run --rm php73 composer install
    docker compose run --rm php82 composer install
    docker compose run --rm nodejs npm install

    # 启动容器
    docker compose up -d

    # php73 内初始化环境
    docker compose cp ./install.sh php73:/install.sh
    docker compose exec php73 sh /install.sh php73

    docker compose cp ./install.sh php82:/install.sh
    docker compose exec php82 sh /install.sh php82
}

# 初始化 php73 下的环境
init_php73() {
    composer install

    php artisan key:generate

    php artisan admin:install
    php artisan db:seed
}

# 初始化 php82 下的环境
init_php82() {
    composer install

    php artisan key:generate
    php artisan migrate

    php artisan passport:install
    php artisan db:seed
}

# 初始化 nodejs 下的环境
init_nodejs() {
    echo "nodejs"
}

# 清理环境
clear_docker() {
    source .env

    # 停止容器
    docker compose down

    # 删除储存
    docker volume rm "${COMPOSE_PROJECT_NAME}_pgdata"

    # 删除中间数据
    rm -rf logs/ SimpleEduBackend/.env SimpleEduBackend/vendor/ SimpleEduBackend/storage/logs/*.log SimpleEduSystem/.env SimpleEduSystem/vendor/ SimpleEduSystem/storage/logs/*.log SimpleEduSystem/node_modules/
}

case "$1" in
php73)
    init_php73
    ;;
php82)
    init_php82
    ;;
nodejs)
    init_nodejs
    ;;
clear)
    clear_docker
    ;;
*)
    init_docker
    ;;
esac
