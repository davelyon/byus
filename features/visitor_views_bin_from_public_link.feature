Feature: Visitor views bin from public link

  In order to safely share links with others
  As a visitor
  I want to view a bin publicly

  Scenario: success
    Given 1 bin
    And that bin has the following links:
      | location                    |
      | http://reddit.com/          |
      | http://facebook.com/        |
      | https://foobear-lives.co.uk |
    When I am on the public bin show page
    Then I should see "http://reddit.com/" within the bins links
    And I should see "http://facebook.com/" within the bins links
    And I should see "https://foobear-lives.co.uk" within the bins links
    And I should not see the bin hash
