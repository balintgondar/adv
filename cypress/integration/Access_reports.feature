Feature: As an authorized user, I want to access the Reports page so that I can generate a Data Report

    Background:
    Given Navigate to internal site
    And Login with authorized user
    Then The site has been loaded

    Scenario: Reports can be accessed for authorized users from the “Reports” tab
        Then The "Reports" tab is accessible with items
            |Loan|
            |Broker|
            |Review|

    Scenario: User can only generate one Report at a time
        When User Requests data for "Loan" Report with valid datasetup
        And User generates "Loan" Report
        Then "Loan" Report has been generated
        But "Broker" type report cannot be generated
        And "Review" type report cannot be generated

    Scenario: User can only request one Report type per data pull -1 
        And User Requests data for "Broker" Report with valid datasetup
        Then "Review" type report cannot be generated
        And "Loan" type report cannot be generated
    
    Scenario: User can only request one Report type per data pull -2 
        And User Requests data for "Loan" Report with valid datasetup
        Then "Review" type report cannot be generated
        And "Broker" type report cannot be generated

    Scenario: User can only request one Report type per data pull -3 
        And User Requests data for "Review" Report with valid datasetup
        Then "Loan" type report cannot be generated
        And "Broker" type report cannot be generated

    Scenario: Fields for Reports populate after user selects a Report type - Loan
        When The "Reports" tab is accessible with items
            |Loan|
            |Broker|
            |Review|
        Then Fields are not populated
        When User Requests data for "Loan" Report with valid datasetup
        Then data fields for "Loan" report are populated
        When User generates "Loan" Report
        Then Data is fulfilled from "production" database
        But Data is not fulfilled from "development" database
        
    Scenario: Fields for Reports populate after user selects a Report type - Review
        When The "Reports" tab is accessible with items
            |Loan|
            |Broker|
            |Review|
        Then Fields are not populated
        When User Requests data for "Review" Report with valid datasetup
        Then data fields for "Review" report are populated
        When User generates "Review" Report
        Then Data is fulfilled from "production" database
        But Data is not fulfilled from "development" database
             
    Scenario: Fields for Reports populate after user selects a Report type - Broker
        When The "Reports" tab is accessible with items
            |Loan|
            |Broker|
            |Review|
        Then Fields are not populated
        When User Requests data for "Broker" Report with valid datasetup
        Then data fields for "Broker" report are populated
        When User generates "Broker" Report
        Then Data is fulfilled from "production" database
        But Data is not fulfilled from "development" database   


    Scenario: User can download a Loan Report by clicking on the Download button
        Given User Requests data for "Loan" Report with valid datasetup
        And data fields for "Loan" report are populated
        And User generates "Loan" Report
        And "Loan" Report has been generated
        When User selects "Download" button
        Then "Loan" report has been downloaded
        But "Broker" report has not been downloaded
        And "Review" report has not been downloaded

     Scenario: User can download a Broker Report by clicking on the Download button
        Given User Requests data for "Broker" Report with valid datasetup
        And data fields for "Broker" report are populated
        And User generates "Broker" Report
        And "Broker" Report has been generated
        When User selects "Download" button
        Then "Broker" report has been downloaded
        But "Loan" report has not been downloaded
        And "Review" report has not been downloaded

    Scenario: User can download a Review Report by clicking on the Download button
        Given User Requests data for "Review" Report with valid datasetup
        And data fields for "Review" report are populated
        And User generates "Review" Report
        And "Review" Report has been generated
        When User selects "Download" button
        Then "Review" report has been downloaded
        But "Loan" report has not been downloaded
        And "Broker" report has not been downloaded