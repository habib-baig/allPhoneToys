Feature: Admin login
  Schedule a pickup

  Background:
    Given I am on the login page
   
  Scenario: Schedule a pickup successfully
    When I am signed in as an admin
    Then I should see "Admin Dashboard"