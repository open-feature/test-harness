@grace
Feature: Flagd Provider State Changes

  Background:
    Given a flagd provider is set

  Scenario Outline: Provider events
    Given a <event> handler is added
    When the connection is lost for 20s
    Then the <event> handler must run
    Examples:
      | event                          |
      | PROVIDER_ERROR                 |
      | PROVIDER_STALE                 |
      | PROVIDER_READY                 |

  Scenario: Provider events chain ready -> stale -> error -> ready
    Given a PROVIDER_READY handler is added
    And a PROVIDER_STALE handler is added
    And a PROVIDER_ERROR handler is added
    Then the PROVIDER_READY handler must run
    When the connection is lost for 20s
    Then the PROVIDER_STALE handler must run
    Then the PROVIDER_ERROR handler must run
    Then the PROVIDER_READY handler must run
