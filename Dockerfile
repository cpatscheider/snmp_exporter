FROM alpine:latest

ARG TARGETPLATFORM
ARG VERSION

RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  ARCH=amd64  ;; \
         "linux/arm64")  ARCH=arm64  ;; \
         "linux/arm/v7") ARCH=armhf  ;; \
         "linux/arm/v6") ARCH=armel  ;; \
         "linux/386")    ARCH=i386   ;; \
    esac \
    && cd /tmp \
    && wget https://github.com/prometheus/snmp_exporter/releases/download/v${VERSION}/snmp_exporter-${VERSION}.linux-${ARCH}.tar.gz \
    && mkdir /usr/bin/snmp_exporter \
    && tar -xzvf /tmp/snmp_exporter-${VERSION}.linux-${ARCH}.tar.gz -C /usr/bin/snmp_exporter --strip-components 1\
    && chmod 510 /usr/bin/snmp_exporter/snmp_exporter \
    && rm /tmp/snmp_exporter-${VERSION}.linux-${ARCH}.tar.gz

ENTRYPOINT ["/usr/bin/snmp_exporter/snmp_exporter","--config.file=/usr/bin/snmp_exporter/snmp.yml"]