FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add openrc libc6-compat wget

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz && \
	tar -xzvf grafana-7.4.3.linux-amd64.tar.gz && rm -f grafana-7.4.3.linux-amd64.tar.gz

ENV PATH=/grafana-7.4.3/bin:$PATH
WORKDIR /grafana-7.4.3

RUN echo -e "[security]\nadmin_user = jraye\nadmin_password = 123" > conf/custom.ini
COPY ./datasource.yaml conf/provisioning/datasources/
COPY ./dashboards.yaml conf/provisioning/dashboards/
COPY ./dashboards/* /var/lib/grafana/dashboards/

EXPOSE 3000

ENTRYPOINT grafana-server
