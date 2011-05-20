Feature: Visitor adds most recently added links

  Scenario: success
    Given the following bin:
      | title | My Happy Bin |
    And that bin has 50 links
    When I am on the links latest page
    Then I should see 30 links
