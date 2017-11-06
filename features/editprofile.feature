Feature: Edit profile
  Edit profile info

  Background:
    Given I am signed in
    And I should see "Edit"
    
  Scenario: Update user date successfully
    When I follow "Edit"
    Then I should see "Select your preferred service provider"
    And I fill in the select field "preferredProvider" with "Lyca"
    And I fill in the select field "preferredLocation" with "College main"
    And I press "Save"
    Then I should see "User was successfully updated."