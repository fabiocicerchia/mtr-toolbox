# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.2](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.1.1...v1.1.2) (2026-09-04)


### Bug Fixes

* **ci:** pin the editorconfig-checker binary version ([#38](https://github.com/fabiocicerchia/mtr-toolbox/issues/38)) ([9165b0d](https://github.com/fabiocicerchia/mtr-toolbox/commit/9165b0d916a702bdf30f02c6a9bee81d5ba78739))

## [1.1.1](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.1.0...v1.1.1) (2026-08-29)


### Bug Fixes

* unblock quality and clear the Scorecard pinned-dependencies finding ([#32](https://github.com/fabiocicerchia/mtr-toolbox/issues/32)) ([cd14b44](https://github.com/fabiocicerchia/mtr-toolbox/commit/cd14b44644cadf555cfa6b8ca91cbf87f1e56a31))

## [1.1.0](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.0.2...v1.1.0) (2026-08-25)


### Features

* **docs:** build the docs site in Actions and drop Read the Docs ([#30](https://github.com/fabiocicerchia/mtr-toolbox/issues/30)) ([efef1c6](https://github.com/fabiocicerchia/mtr-toolbox/commit/efef1c681629fad1af4002282e7e6d2dc962ded0))

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
