# Getting Started

## Prerequisites

Docker, or a Kubernetes cluster where you can create ephemeral containers.
Nothing to install — the image is the tool.

Pin the tag. `:latest` in a runbook defeats the reason this image exists.

## Debug a pod's network

```sh
kubectl debug -it my-pod --image=fabiocicerchia/mtr-toolbox:0.1.0 --target=app
```

You land in a bash shell **inside the pod's network namespace**, so `ip`,
`dig`, `curl` and `tcpdump` see exactly what the application sees — its
`/etc/resolv.conf`, its routes, its service IPs.

`--target=app` matters for process-level tools, not for network ones (a pod
already shares one netns). Use it when you also want `nsenter`-style visibility
into the target container.

If the raw-socket tools fail with `Operation not permitted`, the debug
container did not get the capability:

```sh
kubectl debug -it my-pod --image=fabiocicerchia/mtr-toolbox:0.1.0 \
  --target=app --profile=netadmin
```

## Debug a node

```sh
docker run --rm -it --net=host --cap-add=NET_RAW --cap-add=NET_ADMIN \
  fabiocicerchia/mtr-toolbox:0.1.0
```

`--net=host` puts you on the node's stack rather than a bridge, which is what
you want when the question is "does the node reach it", not "does the container
reach it".

## Capture the snapshot first

Before theorising, get the state into the ticket:

```sh
docker run --rm --net=host fabiocicerchia/mtr-toolbox:0.1.0 \
  -c 'netreport api.example.com' | tee incident-1234-netreport.txt
```

That gives you links, addresses, routes, `resolv.conf`, then resolution, ping
and an `mtr` report for the host. Failing probes are reported and do not stop
the rest — the failure is usually the finding.

## The four questions, and the tool for each

```sh
# Where does the path break, and does it flap?
mtr --report --report-cycles 20 api.example.com

# Is it DNS? (ask the pod's resolver, then a known-good one)
dig api.example.com
dig @1.1.1.1 api.example.com

# Is the port open from here, or is something eating the SYN?
nc -vz api.example.com 443
tcptraceroute api.example.com 443

# Is it bandwidth, or is it latency? (needs `iperf3 -s` on the other end)
iperf3 -c iperf-server.default.svc.cluster.local
```

For "is anything arriving at all", capture rather than guess:

```sh
tcpdump -ni any -c 50 'port 443 and host api.example.com'
```

## Run it unprivileged

The image defaults to root because `tcpdump`, `mtr` and `ping` need raw
sockets. When you do not need those:

```sh
docker run --rm -it --user 10001 fabiocicerchia/mtr-toolbox:0.1.0
```

`curl`, `dig`, `socat`, `nc` and `openssl` all still work; the raw-socket
tools will not.

## Development

```sh
make build     # docker build
make lint      # hadolint + shellcheck on `netreport`
make test      # asserts every advertised tool is present and runnable
make release   # multi-arch buildx push
```

The smoke test is the contract for the package list: a tool that is in the
README but not in `test.sh` can vanish on a base-image bump without anyone
noticing until an incident.
