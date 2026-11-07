@domain:developer-tooling @area:auto-formatting @from:mtr-toolbox/makefile
Feature: Auto-fixing formatting
  Lets a contributor fix whitespace, line endings and final newlines across the tree in one step without a fix being reported as a failure.

  @id:developer-tooling.auto-formatting.001 @rule:devtools.format.rewrite-is-not-failure @inferred @source:Makefile#format
  Scenario: Formatting that rewrites files still finishes successfully
    Given Given a tracked file has trailing whitespace and no final newline
    When When the contributor runs the formatter
    Then Then the trailing whitespace is removed and a final newline is added
    And And mixed line endings are normalised
    And And each fixer's report is shown
    And And the formatter finishes with exit status 0
