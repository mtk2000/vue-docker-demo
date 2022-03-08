# 生产模式下的构建

FROM node:12-alpine

WORKDIR /build

RUN npm set registry https://registry.npm.taobao.org

COPY package.json /build/package.json

RUN npm install

COPY ./ /build

RUN npm run build
