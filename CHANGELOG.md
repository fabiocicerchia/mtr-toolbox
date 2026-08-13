# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.0.1...v1.0.2) (2026-08-13)


### Bug Fixes

* security and code-quality findings ([#21](https://github.com/fabiocicerchia/mtr-toolbox/issues/21)) ([d38455e](https://github.com/fabiocicerchia/mtr-toolbox/commit/d38455e67a48e2c77e64cca6a9c2c97af308b9ec))

## [1.0.1](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.0.0...v1.0.1) (2026-08-10)


### Bug Fixes

* publish the image from the release job so it actually runs ([d454634](https://github.com/fabiocicerchia/mtr-toolbox/commit/d4546348e7f09e23217552fce796a71ca7ccf96e))

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
