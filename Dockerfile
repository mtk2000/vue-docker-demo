# 基础镜像
FROM   node:12-alpine

# 设置当前工作目录 code
WORKDIR   /code

# 拷贝 vue 源码到目录 code
COPY  ./  /code

# 安装 vue 依赖
RUN  yarn  install

# vue 构建打包
RUN  yarn  build

# 镜像内全局安装 http-server 依赖
RUN  yarn  global  add  http-server

# 设置当前工作目录为 /www/vue
# www 用来存放生产的静态打包项目
WORKDIR  /www/vue

# 把 vue 构建打包输出的静态文件，
# 移动到 /www/vue 目录
RUN  mv  /code/dist/*   /www/vue

# 删除 vue 项目源码，减少镜像体积
RUN  rm  -rf  /code

# 给容器内部设置固定端口 8821
EXPOSE  8821

# 启动容器后，默认执行的命令
CMD  http-server  -p  8821
