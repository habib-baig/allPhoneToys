Feature: Edit profile
  Edit profile info

  Background:
    Given I am signed in
    And I should see "Edit profile"
    
  Scenario: Update user date successfully
    When I follow "Edit profile"
    Then I should see "Select your preferred service provider"
    And I fill in "user_name" with "xyz123"
    And I press "Save"
    Then I should see "User was successfully updated."
    Then I should see "xyz123"