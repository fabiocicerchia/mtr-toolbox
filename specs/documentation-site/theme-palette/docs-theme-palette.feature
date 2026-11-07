@domain:documentation-site @area:theme-palette @from:docs/stylesheets
Feature: Theming the documentation site
  Gives readers of the docs and the splash page one consistent look, in light and dark, with no network requests for styling.

  Background:
    Given the documentation site and the splash page are published together

  @id:documentation-site.theme-palette.001 @rule:docs.theme.single-accent-palette @inferred @source:docs/stylesheets/extra.css#:root @questionable
  Scenario: The docs and the splash page share one accent colour pair
    Given the accent pair is set to #38bdf8 and #3b82f6
    When a visitor opens the splash page and then the rendered docs
    Then the splash page title and the primary button use a gradient from #38bdf8 to #3b82f6
    And the "Install" label and the "Full docs" link on the splash page are #3b82f6
    And the docs home hero title and primary buttons use the same gradient, and links in light mode are #3b82f6
    And changing the pair in the docs theme changes both the splash page and the docs

  @id:documentation-site.theme-palette.002 @rule:docs.theme.scheme-legible-links @inferred @source:docs/stylesheets/extra.css#[data-md-color-scheme="slate"]
  Scenario Outline: Each colour scheme uses the accent that stays readable on its background
    Given the reader's colour scheme is <scheme>
    When the reader views a docs page
    Then the page background is <background>
    And links are shown in <link colour>

    Examples:
      | scheme | background                                     | link colour |
      | light  | the default light ground                       | #3b82f6     |
      | dark   | #0b0f1a, with the header and tabs also #0b0f1a | #38bdf8     |

  @id:documentation-site.theme-palette.003 @rule:docs.theme.no-network-assets @inferred @source:docs/stylesheets/extra.css#:root
  Scenario: The docs load no fonts from the network
    Given the reader has no access to any font CDN
    When the reader opens a docs page
    Then body text is set in the system sans-serif stack
    And code is set in the system monospace stack
    And the page requests no web font
