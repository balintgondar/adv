Feature: As an authorized user, I want to generate and download a Broker Report so that I can view the list of Insurance Brokers in our system

    Background:
    Given Navigate to internal site
    And Login with authorized user
    Then The site has been loaded

    Scenario: Broker report - Standard fields
    Given User Requests data for "Broker" Report
    When Data is loaded into the form
    Then The following fields are selectable as Standard Fields
    |First Name|
    |Last Name|
    |Brokerage|
    |Phone Number|
    |Email|
    |Mailing Address|
        
    Scenario: First Name and Last Name Fields should be selected by default and included in every Broker Report
    Given User Requests data for "Broker" Report
    When Data is loaded into the form
    And "Broker" Report has been generated
    When "Broker" Report has been downloaded
    Then the opened "Broker" Report has a file type of "csv"
    And Report has a column "First Name"
    And Report has a column "Last Name"

    Scenario: User can add any other combination of Fields apart from the required First Name and Last Name Fields
    Given User Requests data for "Broker" Report
    When Data is loaded into the form
    And User selects "Brokerage" from Standard Fields
    And "Broker" Report has been generated
    When "Broker" Report has been downloaded
    Then the opened "Broker" Report has a file type of "csv"
    And Report has a column "First Name" 
    And Report has a column "Last Name" 
    And Report has a column "Brokerage" 
    But Report doesn't have a column"Email" 
    And Report doesn't have a column "Mailing Address"
    