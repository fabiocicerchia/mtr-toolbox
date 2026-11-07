@domain:developer-tooling @area:auto-formatting @from:mtr-toolbox/makefile
Feature: Auto-fixing formatting
  Lets a contributor fix whitespace, line endings and final newlines across the tree in one step without a fix being reported as a failure.

  @id:developer-tooling.auto-formatting.001 @rule:devtools.format.rewrite-is-not-failure @inferred @source:Makefile#format
  Scenario: Formatting that rewrites files still finishes successfully
    Given a tracked file has trailing whitespace, mixed line endings and no final newline
    When the contributor runs the formatter
    Then the trailing whitespace is removed and a final newline is added
    And mixed line endings are normalised
    And each fixer's report is shown
    And the formatter finishes with exit status 0
