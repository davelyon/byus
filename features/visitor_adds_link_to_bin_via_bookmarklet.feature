Feature: Visitor adds link to bin via bookmarklet
  @javascript
  Scenario: Success
    Given 1 bin
    When I am on the bin show page
    And I follow "Bookmarklet"
    Then I should see "Link Saved" within "#byus_link_saver"
    And the bin should have that link
