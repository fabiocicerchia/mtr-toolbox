# Architecture

An Alpine base, one `apk add` layer, and one script. There is no application
here — the deliverable is *a specific set of bytes you can name in a runbook*.

```
alpine:3.22
  └── apk add mtr iperf3 tcpdump bind-tools nmap socat netcat-openbsd
              tcptraceroute conntrack-tools iproute2 ethtool iputils
              curl openssl bash
  └── netreport            one-shot snapshot: links, addrs, routes, DNS [, host]
  └── ENTRYPOINT /bin/bash
```

## Why this exists when netshoot does

netshoot is excellent and this is not trying to replace it in general. Two
differences decide when you want this one instead:

**It is versioned.** `netshoot:latest` in a runbook means the runbook is not
reproducible: the tools you get during next quarter's incident are not the ones
you wrote the steps against. Here the tag pins the whole tool set, and the
Alpine base is pinned in the Dockerfile rather than floating.

**It is small.** The package list is deliberately short, and additions are
argued for. An image you hesitate to pull onto a struggling node is an image
you do not use during the incident it was built for.

## `netreport` is the opinionated part

Everything else in the image is upstream tooling behaving normally. `netreport`
is the one editorial decision: which five things you always want captured
before you start theorising.

```
netreport            links, addresses, routes, resolv.conf
netreport <host>     the above, plus dig, ping and an mtr report for that host
```

It runs with `set -uo pipefail` and **no `-e`**, and each probe ends in
`|| true`. That is deliberate: a snapshot that aborts on the first failure is
useless precisely when it matters, because the failing probe is the finding.
A host that does not resolve should still leave you with the routing table.

Output is plain text with `===== SECTION =====` banners, so it pastes into an
incident channel or a ticket without reformatting. That is its whole output
contract.

## The entrypoint is a shell, on purpose

`ENTRYPOINT ["/bin/bash"]` rather than a tool, because you do not know in
advance which tool you need — that is the situation the image is for.
`docker run ... -c 'netreport api.example.com'` covers the scripted case.

## Privileges

The image runs as root by default because raw sockets genuinely require it:
`tcpdump`, `mtr` and `ping` do not work otherwise, and an image that cannot
run `mtr` is not this image. A `net` user (uid 10001) is pre-created for the
cases that do not need raw sockets — `--user 10001` and `curl`, `dig`, `socat`
and `nc` still work.

In Kubernetes the capabilities that matter are `NET_RAW` (packet capture,
ICMP) and `NET_ADMIN` (reading and changing link/qdisc state).

## Adding a tool

The bar is: it earns its megabytes during an incident, and there is no way to
answer that question with something already in the list. Add it to the `apk`
list in alphabetical order, then to `test.sh` — the smoke test asserts that
every advertised tool is present and runnable, so an addition that is not
tested is an addition that can silently disappear on the next base bump.
