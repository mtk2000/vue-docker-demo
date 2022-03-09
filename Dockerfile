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

# vue 项目构建打包生成静态资源文件后，记得删除源码，减少镜像体积
# RUN rm -rf /code



