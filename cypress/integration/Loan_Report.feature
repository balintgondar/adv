Feature: As an authorized user, I want to generate and download a Loan Report for a specified date range so that I can view the Loans within that range

    Background:
    Given Navigate to internal site
    And Login with authorized user
    Then The site has been loaded

    Scenario: Loan report - Standard fields
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    Then The following fields are selectable as Standard Fields
    |Lender|
    |External Loan ID|
    |Internal Loan ID|
    |Loan Name|
    |Program|
    |Status (current Status of Loan)|
    |Asset Types|
    |Number of Location Assets (non-Insured Type Assets)|
    |Number of Insured Assets (non-Location Type Assets)|
    |Number of Assets|
    |CreatedBy|
    |UpdatedBy
    |AssignedTo|

    Scenario: Loan report - Date fields
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    Then The following fields are selectable as Date Fields
    |Closing Date|
    |Compliance Deadline Date|
    |CreatedAt Date|
    |UpdatedAt Date|
    |AssignedAt|
    |DateClosedAt|
    |PostClosePendingAt|
    |ReviewInProgressAt|
    |Last Status Changed At|


    Scenario: Loan report - Computed fields
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    Then The following fields are selectable as Date Fields
    |Time to Resolution|


    /* Assuming date validation on the form*/
    Scenario: Each Loan Report must have a Date Field selected as the Primary Date Field -1 
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    Then "Loan" type report cannot be generated
    And User can not select a random item from Standard Fields
    And User can not select a random item from Computed Fields
    When User selects an item from Date Fields as Primary Date field
    And User enters "12/10/22-12/01/21" as DateRange
    And User selects a random item from Standard Fields
    And User selects a random item from Computed Fields
    Then "Loan" type report cannot be generated
    When User enters "12/10/22-12/15/22" as DateRange
    Then "Loan" Report has been generated

        
    Scenario: Each Loan Report must have a Date Field selected as the Primary Date Field - with External and Internal Loan ID
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    Then "Loan" type report cannot be generated
    When User selects an item from Date Fields as Primary Date field
    And User enters "12/10/22-12/20/22" as DateRange
    Then "Loan" Report has been generated
    And "External Loan ID" is visible on the report
    And "Internal Loan ID" is visible on the report
            
    Scenario: User can only select one Primary Date Field from the dropdown at a time
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    Then "Loan" type report cannot be generated
    When User selects an item from Date Fields as Primary Date field
    And User enters "12/10/22-12/20/22" as DateRange
    Then User can not select another item from Date Fields as Primary Date field
    But "Loan" Report has been generated

    Scenario: Date Range will remain the same on the newly selected Primary Date Field 
    Given User Requests data for "Loan" Report
    When Data is loaded into the form
    When User selects "CreatedAt" from Date Fields as Primary Date field
    And User enters "12/10/22-12/22/22" as DateRange
    And User selects an item from Standard Fields
    And User selects an item from Computed Fields
    When User selects "Closing Date" from Date Fields as Primary Date field
    Then DateRange should set to "12/10/22-12/22/22"

    Scenario: Primary Date Field Column should be sorted from oldest to newest date of that Field 
    Given User Requests data for "Loan" Report
    And Data is loaded into the form
    When User selects an item from Date Fields as Primary Date field
    Then Primary Date Field Column should be sorted "DESC"

    Scenario: Report should be generated and downloaded as a CSV
    Given User Requests data for "Loan" Report
    And Data is loaded into the form
    And User selects "CreatedAt" from Date Fields as Primary Date field
    And User selects "Loan Name" from Standard Fields
    And User enters "11/10/21-11/20/22" as DateRange
    And "Loan" Report has been generated
    When "Loan" Report has been downloaded
    Then the opened "Loan" Report has a file type of "csv"
    And Report has a column "CreatedAt"
    And Report has a column "Loan Name"
    And Report has a column "External Loan ID" 
    And Report has a column "Internal Loan ID"
    And Report doesn't have a column "Program"
    And Report doesn't have a column "Status"
    And Report doesn't have a column "Number of Assets"

