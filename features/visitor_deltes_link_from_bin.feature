Feature: Visitor deletes link from bin

  In order to more easilly share links
  As a visitor on the bin show page
  I want to delete a link

  Scenario: Success
    Given 1 bin
    And that bin has the following links:
      | location                     |
      | http://reddit.com/           |
      | http://google.com/           |
      | http://news.ycombinator.com/ |
    When I am on the bin show page
    And I follow "delete" within the second link
    Then I should be on the bin show page
    And I should see "Link deleted" within "#flash > .success"
    And I should not see "http://google.com" within ".links"
