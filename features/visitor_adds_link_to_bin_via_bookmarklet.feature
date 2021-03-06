@javascript
Feature: Visitor adds link to bin via bookmarklet

  Scenario: Success
    Given the following bin:
      | title | Bin Bin |
    When I am on the bin show page
    And I follow "xBookmarklet-Same-Domain" within "#bin_controls"
    And I am on the bin show page
    Then the bin should have that link
    And I should see "this.isby.us : Bin Bin Bin" within the bins links

  Scenario: Success Message
    Given 1 bin
    When I am on the bin show page
    And I follow "xBookmarklet-Same-Domain" within "#bin_controls"
    Then I should see "Link Saved"
