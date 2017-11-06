Feature: Schedule a pickup
  Schedule a pickup

  Background:
    Given I am signed in
    And I should see "schedulePickup"
    
  Scenario: Schedule a pickup successfully
    When I follow "schedulePickup"
    Then I should see "Select your service provider"
    Then I should see "Select location"
    And I press "Schedule"
    Then I should see "Transaction was successfully created."