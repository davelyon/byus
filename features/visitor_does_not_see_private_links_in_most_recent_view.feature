Feature: Visitor does not see private links in most recent view

  Scenario: success
    Given the following bin:
      | title        | No See Ums |
      | allow_public | false      |
    And that bin has the following links:
      | location               |
      | http://nolink.for.you/ |
    When I am on the links latest page
    Then I should not see "http://nolink.for.you/"
