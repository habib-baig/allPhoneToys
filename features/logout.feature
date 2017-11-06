Feature: Sign out
  Sign out successfully

  Background:
    Given I am signed in
    And I should see "Log out"
    
  Scenario: Update user date successfully
    When I follow "Log out"
    Then I should see "Don't have an account?"