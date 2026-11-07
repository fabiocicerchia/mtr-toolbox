# Specifications of mtr-toolbox

What this code does, one atomic Gherkin scenario per behaviour, read from the code by code-atlas.
Tags: `@verified` a test asserts it · `@inferred` read from the code only · `@gap` an entry point no test covers · `@human` written or amended by a person, never rewritten.

## Build and release
Building, testing, publishing and installing the toolbox.

- **Host install**: [Installing netreport on a host](build-and-release/host-install/host-install.feature) (3)
- **Publishing**: [Publishing the image](build-and-release/publishing/image-publishing.feature) (2)

## Connectivity snapshot
netreport, the one-shot report of a host's network state that gets pasted into incident notes.

- **Local network state**: [Snapshotting local network state](connectivity-snapshot/local-network-state/local-network-snapshot.feature) (3)
- **Target probing**: [Probing a target host](connectivity-snapshot/target-probing/target-probing.feature) (3)

## Developer tooling
How contributors discover commands and keep the tree clean, formatted and secure.

- **Auto-formatting**: [Auto-fixing formatting](developer-tooling/auto-formatting/auto-formatting.feature) (1)
- **Command discovery**: [Discovering the available commands](developer-tooling/command-discovery/command-discovery.feature) (1)
- **Security scanning**: [Scanning the tree for security issues](developer-tooling/security-scanning/security-scanning.feature) (1)

## Diagnostics toolbox
The network tools the image ships and how an operator gets a shell to use them.

- **Bundled tools**: [Running bundled diagnostic tools](diagnostics-toolbox/bundled-tools/bundled-diagnostic-tools.feature) (1)
- **Privileges**: [Choosing root or an unprivileged user](diagnostics-toolbox/privileges/toolbox-privileges.feature) (2)
- **Shell access**: [Opening a shell in the toolbox](diagnostics-toolbox/shell-access/toolbox-shell-access.feature) (1)

## Documentation site
The look of the project's docs site and its landing page.

- **Page layout**: [Laying out documentation pages](documentation-site/page-layout/docs-page-layout.feature) (2)
- **Theme and palette**: [Theming the documentation site](documentation-site/theme-palette/docs-theme-palette.feature) (3)

## Image provenance and licensing
What the published image declares about where it came from, its version pins and its licences.

- **Image metadata**: [Reading image metadata](image-supply-chain/image-metadata/image-metadata.feature) (1)
- **License notices**: [Checking licence terms inside the image](image-supply-chain/license-notices/license-notices.feature) (1)
- **Pinned base image**: [Rebuilding from a pinned base](image-supply-chain/pinned-base/pinned-base-image.feature) (1)
