@domain:developer-tooling @area:command-discovery @from:mtr-toolbox/makefile
Feature: Discovering the available commands
  Lets a contributor find every make verb and what it does without reading the Makefile.

  @id:developer-tooling.command-discovery.001 @rule:devtools.make.bare-make-lists-commands @inferred @source:Makefile#help
  Scenario: Running make with no target lists every command and its description
    Given Given a checkout of mtr-toolbox
    When When the contributor runs make with no target
    Then Then nothing is built or pushed
    And And each command is listed with its description, one per line
    And And the list includes "build", "test", "lint", "install", "analyze", "push" and "release"
