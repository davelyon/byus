Feature: Visitor changes bin title

  In order to more accurately describe a bin
  As a visitor
  I want to change the bin title

  Scenario: Success
    Given the following bin:
      | title | http://reddit.com|
    And I am on the bin show page
    When I follow "Rename Bin"
    And I fill in "bin_title" with "My Reddit Bin"
    And I press "Change Title"
    Then I should be on the bin show page
    And I should see "My Reddit Bin" within "h1.page_title"
