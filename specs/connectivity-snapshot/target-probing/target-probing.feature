@domain:connectivity-snapshot @area:target-probing @from:mtr-toolbox/netreport
Feature: Probing a target host
  Lets an operator add name resolution, latency and the network path to a named dependency to the same incident snapshot.

  Background:
    Given the operator has a shell in the mtr-toolbox image

  @id:connectivity-snapshot.target-probing.001 @rule:connectivity.probing.resolve-ping-path-sections @inferred @source:netreport#section
  Scenario: Given a target, the snapshot adds its resolved addresses, a short ping and an mtr path report
    Given the target host "api.example.com" is reachable
    When the operator runs netreport with target "api.example.com"
    Then after the DNS section the output contains "===== RESOLVE api.example.com =====", "===== PING api.example.com =====" and "===== PATH api.example.com =====" in that order
    And the RESOLVE section lists the target's short DNS answers (addresses, or the CNAME chain then addresses), one per line with no other text
    And the PING section shows 3 echo requests, each waiting at most 2 seconds for a reply
    And the PATH section shows an mtr report over 5 cycles
    And the command exits with status 0

  @id:connectivity-snapshot.target-probing.002 @rule:connectivity.probing.continues-after-failed-step @inferred @source:netreport#section
  Scenario: A failed probe step doesn't stop the remaining steps
    Given the target host "db.example.com" drops all ICMP
    When the operator runs netreport with target "db.example.com"
    Then the PING section shows 100% packet loss
    And the "===== PATH db.example.com =====" section still follows with an mtr report
    And the command exits with status 0

  @id:connectivity-snapshot.target-probing.003 @rule:connectivity.probing.unresolvable-target-exits-zero @inferred @source:netreport#section @questionable
  Scenario: An unresolvable target still produces a full report that exits zero
    Given the name "nosuch.example.invalid" does not resolve
    When the operator runs netreport with target "nosuch.example.invalid"
    Then the RESOLVE section is empty
    And the PING and PATH sections show their tools' resolution errors
    And the command exits with status 0
