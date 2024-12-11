Feature: flagd provider disconnect and reconnect functionality

  # This test suite tests the reconnection functionality of flagd providers

  Scenario: Provider reconnection
    Given a flagd provider is set
    And a PROVIDER_READY handler is added
    And a PROVIDER_ERROR handler is added
    Then the PROVIDER_READY handler must run
    When the connection is lost for 8s
    Then the PROVIDER_ERROR handler must run
    Then the PROVIDER_READY handler must run

  Scenario: Provider unavailable
    Given flagd is unavailable
    When a flagd provider is set and initialization is awaited
    Then an error should be indicated within the configured deadline
