Feature: User login
  Create a new user and login successfully
  Correct password should take the user to the next page
  Incorrect username or password gives error message
  Username should be a valid email id

  Background:
    Given I am on the login page
    
  Scenario: Create a new user and login successfully
    When I follow "Sign Up"
    Then I am on the signup page
    
    When I fill in "user_name" with "xyz"
    And I fill in "user_email" with "abc@test.com"
    And I fill in "user_phone" with "9876543210"
    And I fill in "user_password" with "qwerty"
    And I fill in "user_prefAmount" with "23"
    And I press "Sign Up"
    Then I should see "User was successfully created."
    
    When I sign in as "abc@test.com" and "qwerty"
    Then I should see "Log out"
    
    And I follow "Log out"
    Then I am on the login page
    
    When I sign in as "abc@test.com" and "q"
    Then I should see "Invalid email/password"
    
    When I sign with invalid email as "abc"
    Then I should see "Invalid email/password"