Feature: Schedule a pickup
  Schedule a pickup

  Background:
    Given I am not signed in
    And I should see "lol"
  Scenario: Schedule a pickup successfully
    When I follow "schedulePickup"