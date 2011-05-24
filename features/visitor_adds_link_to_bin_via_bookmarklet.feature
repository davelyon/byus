@javascript
Feature: Visitor adds link to bin via bookmarklet

  Scenario: Success
    Given 1 bin
    When I am on the bin show page
    And I follow "Bookmarklet"
    And I am on the bin show page
    Then the bin should have that link
    And I should see "Links - Index" within the bins links

  Scenario: Success Message
    Given 1 bin
    When I am on the bin show page
    And I follow "Bookmarklet"
    Then I should see "Link Saved"
