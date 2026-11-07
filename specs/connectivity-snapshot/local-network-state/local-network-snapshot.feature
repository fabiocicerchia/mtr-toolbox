@domain:connectivity-snapshot @area:local-network-state @from:mtr-toolbox/netreport
Feature: Snapshotting local network state
  Gives an on-call operator one paste-ready, greppable block describing the host's links, addresses, routes and DNS for an incident note.

  Background:
    Given the operator has a shell in the mtr-toolbox image

  @id:connectivity-snapshot.local-network-state.001 @rule:connectivity.snapshot.local-sections-in-fixed-order @inferred @source:netreport#section
  Scenario: The snapshot lists links, addresses, routes and DNS under fixed headers in a fixed order
    Given the host has network interfaces, addresses, routes and a resolver config
    When the operator runs netreport
    Then the output contains the sections "===== LINKS =====", "===== ADDRS =====", "===== ROUTES =====" and "===== DNS =====" in that order
    And each section header is preceded by a blank line
    And the LINKS section shows the brief interface list
    And the ADDRS section shows the brief address list
    And the ROUTES section shows the routing table
    And the DNS section shows the contents of /etc/resolv.conf

  @id:connectivity-snapshot.local-network-state.002 @rule:connectivity.snapshot.no-target-no-probing @inferred @source:netreport#section
  Scenario: Without a target the snapshot stops after DNS and exits zero
    Given no target host is given
    When the operator runs netreport
    Then the last section is "===== DNS ====="
    And no RESOLVE, PING or PATH section appears
    And the command exits with status 0

  @id:connectivity-snapshot.local-network-state.003 @rule:connectivity.snapshot.continues-past-missing-tool @inferred @source:netreport#section @questionable
  Scenario: A missing tool doesn't stop the snapshot or make it fail
    Given the ip command is not available on the host
    When the operator runs netreport
    Then the LINKS, ADDRS and ROUTES headers still appear, each followed by a command-not-found error
    And the DNS section still shows the resolver config
    And the command exits with status 0
