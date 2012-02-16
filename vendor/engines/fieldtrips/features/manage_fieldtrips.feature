@fieldtrips
Feature: Fieldtrips
  In order to have fieldtrips on my website
  As an administrator
  I want to manage fieldtrips

  Background:
    Given I am a logged in refinery user
    And I have no fieldtrips

  @fieldtrips-list @list
  Scenario: Fieldtrips List
   Given I have fieldtrips titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of fieldtrips
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @fieldtrips-valid @valid
  Scenario: Create Valid Fieldtrip
    When I go to the list of fieldtrips
    And I follow "Add New Fieldtrip"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 fieldtrip

  @fieldtrips-invalid @invalid
  Scenario: Create Invalid Fieldtrip (without Name)
    When I go to the list of fieldtrips
    And I follow "Add New Fieldtrip"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 fieldtrips

  @fieldtrips-edit @edit
  Scenario: Edit Existing Fieldtrip
    Given I have fieldtrips titled "A Name"
    When I go to the list of fieldtrips
    And I follow "Edit this fieldtrip" within ".actions"
    Then I fill in "Name" with "A different Name"
    And I press "Save"
    Then I should see "'A different Name' was successfully updated."
    And I should be on the list of fieldtrips
    And I should not see "A Name"

  @fieldtrips-duplicate @duplicate
  Scenario: Create Duplicate Fieldtrip
    Given I only have fieldtrips titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of fieldtrips
    And I follow "Add New Fieldtrip"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 fieldtrips

  @fieldtrips-delete @delete
  Scenario: Delete Fieldtrip
    Given I only have fieldtrips titled UniqueTitleOne
    When I go to the list of fieldtrips
    And I follow "Remove this fieldtrip forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 fieldtrips
 