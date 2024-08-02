# 一个简易的教务管理系统

此仓库包含两个关联仓库，是一个完整的可一键启动的 Docker 运行时。

使用 `git clone --recursive git@github.com:imdong/simple-edu-docker-runtime.git` 将仓库与子仓库 clone 到本地。

在目录中执行 `docker compsoe up -d` 即可启动容器与服务。

## 子仓库地址

- 管理员后台: [imdong/simple-edu-backend](https://github.com/imdong/simple-edu-backend)
- 用户后台: [imdong/simple-edu-system](https://github.com/imdong/simple-edu-system)

## 本地开发默认访问地址

- 管理员后台: [http://backend.simple-edu.local/admin/](http://backend.simple-edu.local/admin/)
- 用户后台: [http://frontend.simple-edu.local/](http://frontend.simple-edu.local/)

## 线上预览地址

托管于 [Heroku](https://www.heroku.com/)

- 管理员后台
  - [https://simple-edu-backend.895460.xyz/admin/](https://simple-edu-backend.895460.xyz/admin/)
  - [https://simple-edu-backend-9d8eb648af1d.herokuapp.com/admin/](https://simple-edu-backend-9d8eb648af1d.herokuapp.com/admin/)
- 用户后台:
  - [https://simple-edu-system.895460.xyz/](https://simple-edu-system.895460.xyz/)
  - [https://simple-edu-system-c79c42c542b8.herokuapp.com/](https://simple-edu-system-c79c42c542b8.herokuapp.com/)

## 接口文档

用户后台相关的 API 文件托管于 Postman，接口文档在线预览地址  
[https://documenter.getpostman.com/view/24712719/2sA3rwKtUP](https://documenter.getpostman.com/view/24712719/2sA3rwKtUP)

由 Postman 导出的离线 json 文件在  
[imdong/simple-edu-system/SimpleEdu-System.postman_collection.json](https://github.com/imdong/simple-edu-system/blob/main/SimpleEdu-System.postman_collection.json)

支付系统接入为 [Omise](https://www.omise.co/)

## 演示环境帐号密码

管理员后台帐号: `admin`  
管理员后台密码: `admin`

教师帐号: `teacher`  
教师密码: `teacher`

学生帐号: `student`  
学生密码: `student`

## 安装说明

首次执行请运行本目录下的 `./install.sh` 以初始化各项环境。
