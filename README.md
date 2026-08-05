# mtr-toolbox

[![CI](https://github.com/fabiocicerchia/mtr-toolbox/actions/workflows/ci.yml/badge.svg)](https://github.com/fabiocicerchia/mtr-toolbox/actions/workflows/ci.yml)
[![Code Quality](https://github.com/fabiocicerchia/mtr-toolbox/actions/workflows/code-quality.yml/badge.svg)](https://github.com/fabiocicerchia/mtr-toolbox/actions/workflows/code-quality.yml)
[![Security](https://github.com/fabiocicerchia/mtr-toolbox/actions/workflows/security.yml/badge.svg)](https://github.com/fabiocicerchia/mtr-toolbox/actions/workflows/security.yml)
[![License](https://img.shields.io/badge/license-Apache_2.0-blue.svg)](LICENSE)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/fabiocicerchia/mtr-toolbox/badge)](https://securityscorecards.dev/viewer/?uri=github.com/fabiocicerchia/mtr-toolbox)

A **versioned** network-diagnostics image: `mtr`, `iperf3`, `tcpdump`, `dig`,
`nmap`, `socat`, `tcptraceroute`, `conntrack`, `curl`, `nc` and friends — plus
`netreport`, a one-shot connectivity snapshot for incident notes.

netshoot is great but versionless and huge; this is the small, pinned
alternative you can reference from a runbook and get the same bits next month.

## Install

```sh
make build                       # builds fabiocicerchia/mtr-toolbox:0.1.0 locally
docker pull fabiocicerchia/mtr-toolbox:0.1.0
```

## Usage

Debug a pod's network namespace:

```sh
kubectl debug -it my-pod --image=fabiocicerchia/mtr-toolbox --target=app
```

Ad-hoc ephemeral container on a node's host network:

```sh
docker run --rm -it --net=host --cap-add=NET_RAW --cap-add=NET_ADMIN \
  fabiocicerchia/mtr-toolbox
```

One-shot incident snapshot:

```sh
docker run --rm --net=host fabiocicerchia/mtr-toolbox -c 'netreport api.example.com'
```

## What's inside

`mtr`, `iperf3`, `tcpdump`, `bind-tools` (dig/nslookup), `nmap`, `socat`,
`netcat`, `tcptraceroute`, `conntrack-tools`, `iproute2`, `ethtool`,
`iputils`, `curl`, `openssl`, `bash`. See the Dockerfile for the exact list —
additions welcome, bloat is not.

Raw-socket tools need `NET_RAW`/`NET_ADMIN`; the image defaults to root for
that reason. Pass `--user 10001` for the pre-created unprivileged user.

## Development

`make build` / `make lint` / `make test` / `make release`.

## Documentation

Full docs live in [`docs/`](docs/). Runnable examples live in [`examples/`](examples/).

## License

Apache-2.0 — see [LICENSE](LICENSE).
