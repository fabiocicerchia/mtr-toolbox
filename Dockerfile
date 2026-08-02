# mtr-toolbox — versioned network-diagnostics image (mtr, iperf3, tcpdump,
# dig & friends). A slimmer, versioned alternative to netshoot.
FROM alpine:3.22
LABEL org.opencontainers.image.title="mtr-toolbox" \
      org.opencontainers.image.description="Network diagnostics toolbox: mtr, iperf3, tcpdump, dig, curl, nc" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.source="https://github.com/fabiocicerchia/mtr-toolbox"
RUN apk add --no-cache \
      bash \
      bind-tools \
      conntrack-tools \
      curl \
      ethtool \
      iperf3 \
      iproute2 \
      iputils \
      mtr \
      netcat-openbsd \
      nmap \
      openssl \
      socat \
      tcpdump \
      tcptraceroute \
 && adduser -D -u 10001 net
COPY netreport /usr/local/bin/netreport
# Diagnostics genuinely need root for raw sockets (tcpdump, mtr, ping).
# Drop privileges yourself with `--user 10001` when you don't.
ENTRYPOINT ["/bin/bash"]
