@domain:image-supply-chain @area:pinned-base @from:mtr-toolbox/dockerfile
Feature: Rebuilding from a pinned base
  Operators who rebuild a given version get the same Alpine base, so the image doesn't drift under the same tag.

  @id:image-supply-chain.pinned-base.001 @rule:image-supply-chain.pinned-base.alpine-digest-pinned @inferred @source:Dockerfile#FROM @questionable
  Scenario: A version is always built on the same Alpine base image
    Given a released version of mtr-toolbox
    When the operator rebuilds that version
    Then the image is built on Alpine 3.24 at digest sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a
