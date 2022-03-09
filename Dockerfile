# 生产模式下的构建

FROM node:12-alpine

WORKDIR /code

RUN yarn config set registry https://registry.npm.taobao.org

COPY package.json /code/package.json

RUN yarn install

COPY ./ /code

RUN yarn build

# www，用来存放生产的静态打包项目
WORKDIR /www/vue

RUN mv /code/dist/*  /www/vue

# 此处 运行  docker run  -it vue:2.0.0  /bin/sh

# vue 项目构建打包生成静态资源文件后，记得删除源码，减少镜像体积
RUN rm -rf /code

# 容器内全局安装 http-server 依赖
RUN yarn global add http-server

# 给容器内部设置固定端口 8821
EXPOSE 8821

# 启动容器后，默认执行的命令
CMD http-server -p 8821


