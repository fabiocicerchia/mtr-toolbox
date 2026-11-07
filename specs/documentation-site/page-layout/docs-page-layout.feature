@domain:documentation-site @area:page-layout @from:docs/stylesheets
Feature: Laying out documentation pages
  Keeps docs pages readable on any screen and free of branding that isn't the project's.

  Background:
    Given the documentation site is published

  @id:documentation-site.page-layout.001 @rule:docs.layout.no-placeholder-logo @inferred @source:docs/stylesheets/extra.css#.md-header__button.md-logo
  Scenario: The header shows no stand-in logo while the project has none
    Given the site configures no logo
    When a reader views any docs page
    Then the header shows no logo icon next to the site name
    And the navigation title shows no logo icon

  @id:documentation-site.page-layout.002 @rule:docs.layout.tables-fit-narrow-screens @inferred @source:docs/stylesheets/extra.css#.md-typeset table:not([class]) @questionable
  Scenario: Wide tables stay readable on narrow screens
    Given a docs page contains a table wider than the reader's screen
    When the reader views the page on a narrow screen
    Then the table is drawn as a rounded, bordered card
    And the table can be scrolled sideways to its last column
