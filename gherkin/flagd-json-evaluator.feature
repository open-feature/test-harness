Feature: flagd json evaluation

  # This test suite contains scenarios to test the json-evaluation of flagd and flag-in-process providers.
  # It's associated with the flags configured in flags/changing-flag.json, flags/zero-flags.json, flags/custom-ops.json and evaluator-refs.json.
  # It should be used in conjunection with the suites supplied by the OpenFeature specification.

  Background:
    Given a flagd provider is set

  # evaluator refs
  Scenario Outline: Evaluator reuse
    When a string flag with key <key> is evaluated with default value "fallback"
    And a context containing a key "email", with value "ballmer@macrosoft.com"
    Then the returned value should be <value>
    Examples:
      | key                              | value |
      | "some-email-targeted-flag"       | "hi"  |
      | "some-other-email-targeted-flag" | "yes" |

  # custom operators
  Scenario Outline: Fractional operator
    When a string flag with key "fractional-flag" is evaluated with default value "fallback"
    And a context containing a nested property with outer key "user" and inner key "name", with value <name>
    Then the returned value should be <value>
    Examples:
      | name    | value      |
      | "jack"  | "clubs"    |
      | "queen" | "diamonds" |
      | "ace"   | "hearts"   |
      | "joker" | "spades"   |

  Scenario Outline: Substring operators
    When a string flag with key "starts-ends-flag" is evaluated with default value "fallback"
    And a context containing a key "id", with value <id>
    Then the returned value should be <value>
    Examples:
      | id       | value     |
      | "abcdef" | "prefix"  |
      | "uvwxyz" | "postfix" |
      | "abcxyz" | "prefix"  |
      | "lmnopq" | "none" |

  Scenario Outline: Semantic version operator numeric comparision
    When a string flag with key "equal-greater-lesser-version-flag" is evaluated with default value "fallback"
    And a context containing a key "version", with value <version>
    Then the returned value should be <value>
    Examples:
      | version       | value     |
      | "2.0.0"       | "equal"   |
      | "2.1.0"       | "greater" |
      | "1.9.0"       | "lesser"  |
      | "2.0.0-alpha" | "lesser"  |
      | "2.0.0.0"     | "none" |

  Scenario Outline: Semantic version operator semantic comparision
    When a string flag with key "major-minor-version-flag" is evaluated with default value "fallback"
    And a context containing a key "version", with value <version>
    Then the returned value should be <value>
    Examples:
      | version | value   |
      | "3.0.1" | "minor" |
      | "3.1.0" | "major" |
      | "4.0.0" | "none"  |