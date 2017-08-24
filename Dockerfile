FROM telegraf:latest
LABEL maintainer="jaroslav.barton@comsource.cz"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends snmp-mibs-downloader && \
    rm -rf /var/lib/apt/lists/* && \
    download-mibs && \
    mkdir -p /tmp/juniper && \
    cd /tmp/juniper && \
    curl -L -O "https://www.juniper.net/techpubs/software/junos/junos172/juniper-mibs-17.2R1.13-signed.tgz" && \
    tar xvf juniper-mibs-17.2R1.13-signed.tgz && \
    tar xvf juniper-mibs-17.2R1.13.tgz && \
    cp JuniperMibs/* /usr/share/snmp/mibs/ && \
    rm -rf /tmp/juniper
