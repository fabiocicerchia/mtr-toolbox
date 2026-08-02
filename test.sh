#!/usr/bin/env sh
# Smoke test: every advertised tool is present and runnable.
set -eu
IMAGE="${1:?usage: test.sh <image:tag>}"
docker run --rm "$IMAGE" -c '
  set -e
  mtr --version
  iperf3 --version >/dev/null
  tcpdump --version >/dev/null 2>&1
  dig -v 2>&1 | head -1
  nmap --version >/dev/null
  socat -V >/dev/null
  netreport >/dev/null
  echo PASS
'
