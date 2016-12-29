Feature: Merge articles
  As a blog administrator
  In order to combine similar content
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And there exists an article "Cat"
    And there exists an article "Meow"

  Scenario: A non-admin cannot merge two articles
    Given I am on the edit article page for "Cat"
    Then I should not see "Merge With This Article"


  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am on the edit article page for "Cat"
    And I am logged into the admin panel
    And I enter the article id of "Meow"
    And I press "Merge With This Article"
    Then I should see "Successful merge!"