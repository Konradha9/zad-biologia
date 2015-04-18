Feature: I would like to edit wolfs

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/wolf/"
    Then I should not see "<wolf>"
    And I follow "Create a new entry"
    Then I should see "Wolf creation"
    When I fill in "Name" with "<wolf>"
    And I fill in "Lifespan" with "<lifespan>"
    And I press "Create"
    Then I should see "<wolf>"
    And I should see "<lifespan>"

  Examples:
    | wolf     | lifespan |
    | Lupus    | 15       |
    | Arctos   | 8       |
    | Albus    | 9       |



  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/wolf/"
    Then I should not see "<new-wolf>"
    When I follow "<old-wolf>"
    Then I should see "<old-wolf>"
    When I follow "Edit"
    And I fill in "Name" with "<new-wolf>"
    And I fill in "Lifespan" with "<new-lifespan>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-wolf>"
    And I should see "<new-lifespan>"
    And I should not see "<old-wolf>"

  Examples:
    | old-wolf     | new-wolf    | new-lifespan    |
    | Lupus         | N-E-W-L-U-P | 12             |
    | Arctos        | N-E-W-A-R-C | 11             |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/wolf/"
    Then I should see "<wolf>"
    When I follow "<wolf>"
    Then I should see "<wolf>"
    When I press "Delete"
    Then I should not see "<wolf>"

  Examples:
    |  wolf         |
    | Albus          |
    | N-E-W-L-U-P     |
    | N-E-W-A-R-C     |