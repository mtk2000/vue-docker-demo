# 第1步：选择基础镜像
# 说明：
# 选择 node:9.2.1-alpine, 该镜像体积很小，大约 60 MB，并且已经内置 npm(5.5.1), yarn(1.3.2)
# 不要选择 node:latest ，该镜像体积特别大，超过 900 MB
FROM node:9.2.1-alpine


# 第2步：设置镜像作者信息，它代表你的技术知识版权
# 说明：
# LABEL是一个更灵活的版本，可以替代MAINTAINER
# LABEL为镜像增加元数据，一个LABEL是键值对，多个键值对之间使用空格分开，命令换行时是使用反斜杠\。并且可以轻松查看，例如 docker inspect。
# 注意：MAINTAINER已经过时，在新版本已不推荐使用，推荐使用LABEL完成元数据设置。
LABEL author="彭景焕" \
      email="1016435933@qq.com" \
      description="这是在开发环境下，构建vue项目的镜像文件."


# 第3步：在构建镜像时，指定镜像的工作目录
# 说明：
# 这个工作目录，可以用来存放你的项目源码和构建项目
# 后面的命令操作都是基于此工作目录
WORKDIR /usr/src/vue-docker-demo-develop


# 第4步：拷贝源码，从当前的项目源码，从宿主机拷贝到镜像内指定的目录
# 说明：
# 注意：需要拷贝的目录一定要放在Dockerfile文件的同级目录下
# 第一个 ./ 是当前宿主机上的源码目录，与 Dockerfile 文件所在的目录保持一致
# 第二个 ./ 是镜像内部的 WORKDIR 设置的目录，也就是 /usr/src/my-express-app
COPY ./ ./


# 第5步：在镜像内部的工作目录下，开始镜像构建，运行 npm 安装初始化命令
# 特别要注意：多行命令不要写多个RUN，原因是Dockerfile中每一个指令都会建立一层，多少个RUN就构建了多少层镜像，会造成镜像的臃肿、多层，不仅仅增加了构件部署的时间，还容易出错。
# 要添加多条命令直接在每一条后面添加 && 拼接即可。
RUN yarn install && echo '非常好，yarn install 执行完毕。'


# 第6步：设置镜像对外暴露的端口 49501， 和 package.json 里面设置的端口号保持一致
EXPOSE 49501


# 第7步：容器启动时要运行的命令
CMD yarn serve