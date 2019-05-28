FROM alpine:3.9
LABEL MAINTAINER="Eward <w.mingming@163.com>"

ADD jdk1.8.0_211.tar.gz /opt/java/

RUN echo http://mirrors.aliyun.com/alpine/v3.9/main > /etc/apk/repositories \
    && echo http://mirrors.aliyun.com/alpine/v3.9/community >> /etc/apk/repositories \
    && apk --no-cache add ca-certificates \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
    && apk add glibc-2.29-r0.apk \
    && ln -s /opt/java/jdk1.8.0_211 /opt/java/jdk \
    && rm -rf *.apk

ENV JAVA_HOME=/opt/java/jdk
ENV CLASSPATH=$JAVA_HOME/bin
ENV PATH=.:$JAVA_HOME/bin:$PATH
