@domain:build-and-release @area:publishing @from:mtr-toolbox/makefile
Feature: Publishing the image
  Lets the maintainer publish the versioned image so users can pull a pinned tag or the latest one on amd64 and arm64.

  Background:
    Given Given version.txt holds "1.3.2"

  @id:build-and-release.publishing.001 @rule:release.image.tags-version-and-latest-multi-arch @inferred @source:Makefile#release
  Scenario: A release publishes the version tag and latest for amd64 and arm64
    When When the maintainer releases the image
    Then Then "ghcr.io/fabiocicerchia/mtr-toolbox:1.3.2" is published for linux/amd64 and linux/arm64
    And And "ghcr.io/fabiocicerchia/mtr-toolbox:latest" points at the same multi-arch image

  @id:build-and-release.publishing.002 @rule:release.image.push-only-version-tag @inferred @source:Makefile#push
  Scenario: A push publishes only the version tag, never latest
    When When the maintainer pushes the image
    Then Then "ghcr.io/fabiocicerchia/mtr-toolbox:1.3.2" is rebuilt for the local architecture and published
    And And the "latest" tag is left unchanged
