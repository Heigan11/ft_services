FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add influxdb

EXPOSE 8086

ENTRYPOINT influxd -config /etc/influxdb.conf
