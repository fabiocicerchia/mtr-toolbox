@domain:diagnostics-toolbox @area:bundled-tools @from:mtr-toolbox/dockerfile
Feature: Running bundled diagnostic tools
  Operators debugging a network get one small, versioned image that already has every tool they reach for during an incident.

  Background:
    Given the operator has pulled a tagged mtr-toolbox image

  @id:diagnostics-toolbox.bundled-tools.001 @rule:diagnostics-toolbox.bundled-tools.advertised-tools-present @inferred @source:Dockerfile#RUN apk add
  Scenario Outline: Every advertised diagnostic tool is on the path inside the image
    Given a shell inside the image
    When the operator runs <command>
    Then <command> starts and reports its version or usage instead of "command not found"
    And it can be used for <purpose>

    Examples:
      | command       | purpose                        |
      | mtr           | path tracing                   |
      | tcptraceroute | TCP path tracing               |
      | ping          | reachability                   |
      | iperf3        | throughput testing             |
      | tcpdump       | packet capture                 |
      | dig           | DNS lookups                    |
      | nmap          | port scanning                  |
      | socat         | socket relaying                |
      | nc            | raw TCP/UDP connections        |
      | conntrack     | connection tracking            |
      | curl          | HTTP requests                  |
      | ip            | interfaces and routes          |
      | ethtool       | NIC settings                   |
      | openssl       | TLS checks                     |
      | netreport     | one-shot connectivity snapshot |
