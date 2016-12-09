Feature: Test the application

  Scenario: Signup
    Given I am on "/signup"
    When I fill in "inputEmail" with "test@test.com"
    And I fill in "inputPassword" with "test"
    And I click on xpath "//div[3]//div[2]//div//form//div[3]//div//button"
    Then I should see "Login"
