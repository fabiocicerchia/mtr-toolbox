# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 1.0.0 (2026-08-06)


### Bug Fixes

* **ci:** stop security workflows failing on private repos ([#9](https://github.com/fabiocicerchia/mtr-toolbox/issues/9)) ([a81c072](https://github.com/fabiocicerchia/mtr-toolbox/commit/a81c0723efba11073864200f68a88d47f212c202))
* **pre-commit:** stop check-yaml failing on Helm templates and multi-doc manifests ([1a9a7bf](https://github.com/fabiocicerchia/mtr-toolbox/commit/1a9a7bf0e74a3fd3ba233947046f79bbb10fd54f))

## [Unreleased]

### Added

- Versioned network-diagnostics image (`mtr`, `iperf3`, `tcpdump`, `dig`,
  `nmap`, `socat`, `tcptraceroute`, `conntrack`, `curl`, `nc`) plus
  `netreport`, a one-shot connectivity snapshot for incident notes.

Not yet released.
