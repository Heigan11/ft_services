FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add libc6-compat

RUN mkdir /srcs

WORKDIR /srcs
RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xfz telegraf-1.16.2_linux_amd64.tar.gz

WORKDIR /srcs/telegraf-1.16.2
COPY ./telegraf.conf  ./etc/telegraf
RUN ln -s $(pwd)/etc/telegraf  /etc/telegraf
RUN ln -s $(pwd)/usr/bin/telegraf  /bin/telegraf

ENTRYPOINT telegraf
