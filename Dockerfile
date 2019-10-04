FROM centos:7

WORKDIR /root

RUN  yum install wget -y -q && \
  yum clean all -y && \
  wget https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.0.27/dnscrypt-proxy-linux_x86_64-2.0.27.tar.gz && \
  tar xvzf *tar.gz && mv linux-x86_64 /opt/dnscrypt-proxy && \
  ln -s /opt/dnscrypt-proxy/dnscrypt-proxy /usr/bin

ENV LISTEN_ADDR 0.0.0.0:5300

EXPOSE 5300/tcp 5300/udp

CMD ["dnscrypt-proxy", "-config", "/opt/dnscrypt-proxy/dnscrypt-proxy.toml"]
