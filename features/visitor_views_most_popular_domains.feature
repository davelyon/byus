Feature: Visitor views most popular domains

  Scenario: success
    Given the following domains:
      | root         | links_count |
      | google.com   | 13          |
      | facebook.com | 10          |
      | ze.nu        | 8           |
      | davelyon.net | 6           |
      | vurl.me      | 4           |
      | mobile.me    | 1           |
    When I am on the stats page
    Then I should see "google.com" within the top domains
    And I should see "facebook.com" within the top domains
    And I should see "ze.nu" within the top domains
    And I should see "davelyon.net" within the top domains
    And I should see "vurl.me" within the top domains
    And I should not see "mobile.me" within the top domains

