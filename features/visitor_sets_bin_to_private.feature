Feature: Visitor sets bin to private

  Scenario: Public to private
    Given the following bin:
      | title        | My Private Bin |
      | allow_public | true           |
    When I am on the bin show page
    And I follow "Make this bin private"
    Then I should be on the bin show page
    And I should see "Private" within bin public status

  Scenario: Private to Public
    Given the following bin:
      | title        | My Private Bin |
      | allow_public | false          |
    When I am on the bin show page
    And I follow "Make this bin public"
    Then I should be on the bin show page
    And I should see "Public" within bin public status
