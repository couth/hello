#Version 0.2
ARG server_env
ARG base_image_version=latest
# 基础镜像
FROM alpine:${base_image_version}
# 维护者信息
ARG pipeline_start_user_name
LABEL com.anlulu.image.hello.authors=${pipeline_start_user_name}
ARG working_space
WORKDIR ${working_space}
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && echo "hosts: files dns" > /etc/nsswitch.conf
ADD application ./
CMD ./application