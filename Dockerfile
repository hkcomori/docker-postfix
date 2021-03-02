FROM ubuntu:20.04
LABEL maintainer "hkcomori"

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt-get update && apt-get -y install \
    supervisor \
    postfix \
    sasl2-bin \
    opendkim \
    opendkim-tools \
    rsyslog \
    libssl1.1 \
    && rm -rf /var/lib/apt/lists/*

# Add files
ADD assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
