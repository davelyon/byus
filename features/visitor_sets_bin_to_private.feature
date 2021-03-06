Feature: Visitor sets bin to private

  Scenario: Public to private
    Given the following bin:
      | title        | My Private Bin |
      | allow_public | true           |
    When I am on the bin show page
    And I follow "Make this bin private"
    Then I should be on the bin show page
    And I should see "Private" within bin public status
    And I should not see "Public Link"

  Scenario: Private to Public
    Given the following bin:
      | title        | My Private Bin |
      | allow_public | false          |
    When I am on the bin show page
    And I follow "Make this bin public"
    Then I should be on the bin show page
    And I should see "Public" within bin public status

  Scenario: Visit public view of private bin
    Given the following bin:
      | title        | My Private Bin |
      | allow_public | false          |
    When I go to the public bin show page
    Then I should be on the root page
    And I should see "That bin is private!"
