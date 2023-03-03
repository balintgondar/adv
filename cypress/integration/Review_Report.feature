Feature: As an authorized user, I want to generate and download a Review Report for a specified date range so that I can view Policy level information in our system

    Background:
    Given Navigate to internal site
    And Login with authorized user
    Then The site has been loaded

    Scenario: Review report - Standard fields
    Given User Requests data for "Review" Report
    When Data is loaded into the form
    Then data fields for "Review" report are populated
    Then The following fields are selectable as Standard Fields
   |Product Type|
   |Policy Number
   |Program|
   |Lender|
   |Broker|
   |Brokerage|
   |Number of Location Assets|
   |Display Name per Asset|
   |State (address) of Assets|
   |UpdatedBy|
   |Premium per Asset|
   |Dwelling Limit per Asset|
   |Review Score||

    Scenario: Review report - Date fields
    Given User Requests data for "Review" Report
    When Data is loaded into the form
    Then data fields for "Review" report are populated
    And The following fields are selectable as Date Fields
    |Review Score UpdateAt|
    |CreatedAt|
    |UpdatedAt|


    Scenario: User can only select one Primary Date Field from the dropdown at a time and Primary Date Field Column should be sorted from oldest to newest date of that Field
    Given User Requests data for "Review" Report
    And Data is loaded into the form
    And "Review" type report cannot be generated
    When User selects an item from Date Fields as Primary Date field
    And User enters "12/10/22-12/20/22" as DateRange
    Then User can not select another item from Date Fields as Primary Date field
    And Then Primary Date Field Column should be sorted "DESC"


    Scenario: Each Review Report must have a Date Field selected as the Primary Date Field - with Product Type
    Given User Requests data for "Review" Report
    When Data is loaded into the form
    When User selects an item from Date Fields as Primary Date field
    And User enters "12/10/22-12/20/22" as DateRange
    Then "Review" Report has been generated
    And "Product Type" is visible on the report


    Scenario: Report should be generated and downloaded as a CSV with selected rows
    Given User Requests data for "Review" Report
    And Data is loaded into the form
    And User selects "CreatedAt" from Date Fields as Primary Date field
    And User selects "Premium per Asset" from Standard Fields
    And User enters "11/10/21-11/20/22" as DateRange
    And "Review" Report has been generated
    When "Review" Report has been downloaded
    Then the opened "Review" Report has a file type of "csv"
    And Report has a column "CreatedAt"
    And Report has a column "Product Type"
    And Report has a column "Premium per Asset" 
    And Report doesn't have a column "Program"
    And Report doesn't have a column "Lender"
    And Report doesn't have a column "Policy Number"

    /* Assuming date validation on the form*/
    Scenario: Each Review Report must have a Date Field selected as the Primary Date Field -1 
    Given User Requests data for "Review" Report
    When Data is loaded into the form
    Then "Review" type report cannot be generated
    And "Review" Report can't be downloaded
    And User can not select a random item from Standard Fields
    And User can not select a random item from Date Fields
    When User selects an item from Date Fields as Primary Date field
    And User enters "12/10/22-12/01/21" as DateRange
    And User selects a random item from Standard Fields
    And User selects a random item from Date Fields
    Then "Review" type report cannot be generated
    When User enters "12/10/22-12/15/22" as DateRange
    Then "Review" Report has been generated