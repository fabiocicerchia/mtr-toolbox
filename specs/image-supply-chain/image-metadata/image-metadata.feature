@domain:image-supply-chain @area:image-metadata @from:mtr-toolbox/dockerfile
Feature: Reading image metadata
  Registries, scanners and compliance tools read the image's labels to identify it, trace its source and see its licences.

  @id:image-supply-chain.image-metadata.001 @rule:image-supply-chain.image-metadata.oci-labels @inferred @source:Dockerfile#LABEL @questionable
  Scenario: The image carries OCI labels for its title, description, source and licences
    Given a built mtr-toolbox image
    When a registry or scanner reads the image's labels
    Then org.opencontainers.image.title is "mtr-toolbox"
    And org.opencontainers.image.source is "https://github.com/fabiocicerchia/mtr-toolbox"
    And org.opencontainers.image.licenses is "Apache-2.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MPL-2.0 AND LicenseRef-NPSL"
    And org.opencontainers.image.description names mtr, iperf3, tcpdump, dig, curl and nc
