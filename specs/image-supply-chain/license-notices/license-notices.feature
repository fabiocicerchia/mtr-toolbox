@domain:image-supply-chain @area:license-notices @from:mtr-toolbox/dockerfile
Feature: Checking licence terms inside the image
  Anyone who redistributes the image can read the licence terms of every bundled tool, including nmap's NPSL limits, from inside the image itself.

  @id:image-supply-chain.license-notices.001 @rule:image-supply-chain.license-notices.notice-in-image @inferred @source:Dockerfile#COPY NOTICE @questionable
  Scenario: The image includes a NOTICE with every component's licence and the nmap redistribution limits
    Given a shell inside the image
    When the operator reads /NOTICE
    Then it lists each bundled tool with its licence and upstream URL
    And it states that nmap is under the NPSL, which is not OSI-approved
    And it states that bundling the image in a proprietary or paid product needs an Nmap OEM licence
    And it points to the Alpine aports repository for the corresponding source
