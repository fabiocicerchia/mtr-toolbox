@domain:developer-tooling @area:security-scanning @from:mtr-toolbox/makefile
Feature: Scanning the tree for security issues
  Lets a contributor run the same vulnerability, misconfiguration and secret scan CI runs, before opening a pull request.

  @id:developer-tooling.security-scanning.001 @rule:devtools.analyze.missing-trivy-refused @inferred @source:Makefile#analyze
  Scenario: The scan refuses with install guidance when Trivy is missing
    Given Given Trivy is not installed on the contributor's machine
    When When the contributor runs the security scan
    Then Then the contributor sees "analyze needs trivy: https://trivy.dev/latest/getting-started/installation/" on standard error
    And And the scan exits with status 69
    And And no scan is performed
