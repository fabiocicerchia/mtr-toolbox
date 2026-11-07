@domain:build-and-release @area:host-install @from:mtr-toolbox/makefile
Feature: Installing netreport on a host
  Lets an operator put netreport and its man page on a host outside the container, and take them off again, including into a staged package root.

  Background:
    Given the operator has a checkout of mtr-toolbox

  @id:build-and-release.host-install.001 @rule:host-install.netreport.installs-under-destdir-and-prefix @inferred @source:Makefile#install @questionable
  Scenario Outline: netreport and its man page are installed under the chosen root and prefix
    Given the operator sets DESTDIR to "<destdir>" and PREFIX to "<prefix>"
    When the operator installs netreport on the host
    Then "<destdir><prefix>/bin/netreport" exists and is executable by everyone
    And "<destdir><prefix>/share/man/man1/netreport.1" exists and is readable by everyone
    And the operator sees "installed netreport into <destdir><prefix>/bin"

    Examples:
      | destdir      | prefix     |
      |              | /usr/local |
      | /tmp/pkgroot | /usr       |

  @id:build-and-release.host-install.002 @rule:host-install.netreport.prefix-has-no-default @inferred @source:Makefile#install @questionable
  Scenario: Installing without a prefix puts netreport under the filesystem root
    Given the operator sets neither DESTDIR nor PREFIX
    When the operator installs netreport on the host
    Then netreport is installed as "/bin/netreport"
    And its man page is installed as "/share/man/man1/netreport.1"

  @id:build-and-release.host-install.003 @rule:host-install.netreport.uninstall-removes-installed-files @inferred @source:Makefile#uninstall
  Scenario: Uninstalling removes exactly what install put down
    Given netreport and its man page are installed under PREFIX "/usr/local"
    When the operator uninstalls netreport with PREFIX "/usr/local"
    Then "/usr/local/bin/netreport" no longer exists
    And "/usr/local/share/man/man1/netreport.1" no longer exists
    And the uninstall also succeeds when those files were already absent
