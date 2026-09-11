# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.1](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.3.0...v1.3.1) (2026-09-11)


### Bug Fixes

* **release:** let the release PR carry a token that isn't GITHUB_TOKEN ([#59](https://github.com/fabiocicerchia/mtr-toolbox/issues/59)) ([d3cb105](https://github.com/fabiocicerchia/mtr-toolbox/commit/d3cb105fdb981b2d0b9e1661014375ab66e3bca7))

## [1.3.0](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.2.0...v1.3.0) (2026-09-10)


### Features

* **packaging:** man page, and an install that stages rather than pulls ([#53](https://github.com/fabiocicerchia/mtr-toolbox/issues/53)) ([099f29a](https://github.com/fabiocicerchia/mtr-toolbox/commit/099f29a6f43be19ab704d682ab4be248a8f1a5c4))


### Bug Fixes

* **release:** grant id-token on the job that calls the signing workflow ([#56](https://github.com/fabiocicerchia/mtr-toolbox/issues/56)) ([2902ebf](https://github.com/fabiocicerchia/mtr-toolbox/commit/2902ebfebdd8e08e220e599d6e4e2a609261dfbb))

## [1.2.0](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.1.2...v1.2.0) (2026-09-08)


### Features

* add the eight-verb repo contract ([#47](https://github.com/fabiocicerchia/mtr-toolbox/issues/47)) ([965f59b](https://github.com/fabiocicerchia/mtr-toolbox/commit/965f59be6b0a698fac6eec6b3f6bed9da000c404))


### Bug Fixes

* point install docs at an image tag that exists ([#50](https://github.com/fabiocicerchia/mtr-toolbox/issues/50)) ([a331c2e](https://github.com/fabiocicerchia/mtr-toolbox/commit/a331c2ecd0fef72cd67556289798f0816a6296c6))

## [1.1.2](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.1.1...v1.1.2) (2026-09-04)

### Bug Fixes

- **ci:** pin the editorconfig-checker binary version ([#38](https://github.com/fabiocicerchia/mtr-toolbox/issues/38)) ([9165b0d](https://github.com/fabiocicerchia/mtr-toolbox/commit/9165b0d916a702bdf30f02c6a9bee81d5ba78739))

## [1.1.1](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.1.0...v1.1.1) (2026-08-29)

### Bug Fixes

- unblock quality and clear the Scorecard pinned-dependencies finding ([#32](https://github.com/fabiocicerchia/mtr-toolbox/issues/32)) ([cd14b44](https://github.com/fabiocicerchia/mtr-toolbox/commit/cd14b44644cadf555cfa6b8ca91cbf87f1e56a31))

## [1.1.0](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.0.2...v1.1.0) (2026-08-25)

### Features

- **docs:** build the docs site in Actions and drop Read the Docs ([#30](https://github.com/fabiocicerchia/mtr-toolbox/issues/30)) ([efef1c6](https://github.com/fabiocicerchia/mtr-toolbox/commit/efef1c681629fad1af4002282e7e6d2dc962ded0))

## [1.0.2](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.0.1...v1.0.2) (2026-08-13)

### Bug Fixes

- security and code-quality findings ([#21](https://github.com/fabiocicerchia/mtr-toolbox/issues/21)) ([d38455e](https://github.com/fabiocicerchia/mtr-toolbox/commit/d38455e67a48e2c77e64cca6a9c2c97af308b9ec))

## [1.0.1](https://github.com/fabiocicerchia/mtr-toolbox/compare/v1.0.0...v1.0.1) (2026-08-10)

### Bug Fixes

- publish the image from the release job so it actually runs ([d454634](https://github.com/fabiocicerchia/mtr-toolbox/commit/d4546348e7f09e23217552fce796a71ca7ccf96e))

## 1.0.0 (2026-08-06)

### Bug Fixes

- **ci:** stop security workflows failing on private repos ([#9](https://github.com/fabiocicerchia/mtr-toolbox/issues/9)) ([a81c072](https://github.com/fabiocicerchia/mtr-toolbox/commit/a81c0723efba11073864200f68a88d47f212c202))
- **pre-commit:** stop check-yaml failing on Helm templates and multi-doc manifests ([1a9a7bf](https://github.com/fabiocicerchia/mtr-toolbox/commit/1a9a7bf0e74a3fd3ba233947046f79bbb10fd54f))

## [Unreleased]

### Added

- Versioned network-diagnostics image (`mtr`, `iperf3`, `tcpdump`, `dig`,
  `nmap`, `socat`, `tcptraceroute`, `conntrack`, `curl`, `nc`) plus
  `netreport`, a one-shot connectivity snapshot for incident notes.

Not yet released.
