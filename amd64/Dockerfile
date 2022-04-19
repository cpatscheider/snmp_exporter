FROM alpine:latest

RUN cd /tmp \
    && wget https://github.com/prometheus/snmp_exporter/releases/download/v0.20.0/snmp_exporter-0.20.0.linux-amd64.tar.gz \
    && mkdir /usr/bin/snmp_exporter \
    && tar -xzvf /tmp/snmp_exporter-0.20.0.linux-amd64.tar.gz -C /usr/bin/snmp_exporter --strip-components 1\
    && chmod 510 /usr/bin/snmp_exporter/snmp_exporter \
    && rm /tmp/snmp_exporter-0.20.0.linux-amd64.tar.gz

ENTRYPOINT ["/usr/bin/snmp_exporter/snmp_exporter","--config.file=/usr/bin/snmp_exporter/snmp.yml"]