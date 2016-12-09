Feature: Test the application

  Scenario: Login
    Given I am on "/login"
    When I fill in "inputEmail" with "test@test.com"
    And I fill in "inputPassword" with "test"
    And I click on xpath "//div[3]//div[2]//div//form//div[3]//div//button"
    Then I should see "Home"

  Scenario: Post a comment
    Given I am logged in as "test@test.com"
    And I click on xpath "//a[@data-target='#postModal']"
    And I wait for 2 seconds
    And I fill in "inputTitle" with "test"
    And I attach the file "~/Download/1500x500.png" to "fileupload"
    When I click on xpath "//div[@class='modal-footer']//button[2]"
    And I wait for 2 seconds
    Then I should see "test"

  Scenario: Comment a post
    Given I am logged in as "test@test.com"
    And I click on xpath "//article[1]//div//div//div//div[1]//span[2]"
    And I wait for 2 seconds
    And I fill in "inputComment" with "testComment"
    When I click on xpath "//form[@id='commentForm']//div//button"
    And I wait for 3 seconds
    Then I should see "testComment"

  Scenario: Like a post
    Given I am logged in as "test@test.com"
    When I click on xpath "//span[@id='heart-1']"
    And I wait for 3 seconds
    Then I should see "1" in the "//span[@id='like-1']" element