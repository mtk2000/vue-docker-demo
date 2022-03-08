# 生产模式下的构建

FROM node:12-alpine

WORKDIR /build

RUN yarn config set registry https://registry.npm.taobao.org

# COPY package.json /build/package.json

COPY ./ /build

RUN yarn install

RUN yarn build
