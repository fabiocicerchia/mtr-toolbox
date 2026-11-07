@domain:diagnostics-toolbox @area:shell-access @from:mtr-toolbox/dockerfile
Feature: Opening a shell in the toolbox
  Operators start the image straight into bash, so they can run any tool or a one-off command without extra flags.

  @id:diagnostics-toolbox.shell-access.001 @rule:diagnostics-toolbox.shell-access.starts-in-bash @inferred @source:Dockerfile#ENTRYPOINT @questionable
  Scenario Outline: The image starts in a bash shell, and its arguments go to bash
    Given the operator has pulled a tagged mtr-toolbox image
    When the operator starts the image with <arguments>
    Then <outcome>

    Examples:
      | arguments                     | outcome                                                                  |
      | no arguments, interactively   | an interactive bash prompt opens                                         |
      | -c 'mtr --version; echo PASS' | bash runs the command string and prints the mtr version followed by PASS |
