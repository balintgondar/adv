Feature: As an unauthorized user, I want to access the Reports page 

    Background:
    Given Navigate to internal site

    Scenario: Reports can be accessed only with authorized users
    Given Login with unauthorized user using "username"and "password" as credentials
    Then The access to the site has been forbidden
