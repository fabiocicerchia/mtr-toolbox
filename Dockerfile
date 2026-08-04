# mtr-toolbox — versioned network-diagnostics image (mtr, iperf3, tcpdump,
# dig & friends). A slimmer, versioned alternative to netshoot.
FROM alpine:3.24
LABEL org.opencontainers.image.title="mtr-toolbox" \
      org.opencontainers.image.description="Network diagnostics toolbox: mtr, iperf3, tcpdump, dig, curl, nc" \
      org.opencontainers.image.licenses="Apache-2.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MPL-2.0 AND LicenseRef-NPSL" \
      org.opencontainers.image.source="https://github.com/fabiocicerchia/mtr-toolbox"
# nmap ships under the Nmap Public Source License, not an OSI license. It is
# included here on the NPSL's open-source path: this image is free software,
# nmap is the unmodified Alpine package, and aggregating it in a container is
# not a derivative work. Redistributing this image inside a proprietary or
# commercial product would instead need an Nmap OEM license. See NOTICE.
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
COPY NOTICE /NOTICE
COPY netreport /usr/local/bin/netreport
# Diagnostics genuinely need root for raw sockets (tcpdump, mtr, ping).
# Drop privileges yourself with `--user 10001` when you don't.
ENTRYPOINT ["/bin/bash"]
