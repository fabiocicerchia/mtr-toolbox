@domain:diagnostics-toolbox @area:privileges @from:mtr-toolbox/dockerfile
Feature: Choosing root or an unprivileged user
  Operators get root by default so raw-socket tools work, and can drop to a fixed unprivileged user when they don't need it.

  Background:
    Given the operator has pulled a tagged mtr-toolbox image

  @id:diagnostics-toolbox.privileges.001 @rule:diagnostics-toolbox.privileges.root-by-default @inferred @source:Dockerfile#ENTRYPOINT
  Scenario: The toolbox runs as root unless told otherwise
    Given no user is specified when starting the image
    When the operator checks the current user with `id -u`
    Then it prints 0

  @id:diagnostics-toolbox.privileges.002 @rule:diagnostics-toolbox.privileges.unprivileged-user-10001 @inferred @source:Dockerfile#RUN apk add
  Scenario: An unprivileged user with uid 10001 is available for running without root
    Given the operator starts the image as user 10001
    When the operator checks the current identity with `id`
    Then it shows uid 10001 with the user name net
    And the user is not root
