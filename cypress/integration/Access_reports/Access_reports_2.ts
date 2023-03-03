/// <reference types='cypress' />

import { Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import Common from '../Common';

Given('Navigate to internal site', () => {
    Common.goToLoginPage();
});

When('Login with unauthorized user using {string} and {string} as credentials', (username: string, password:string) => {
    Common.enterInValidLoginData(username,password);
});


Then('The access to the site has been forbidden', () => {
    Common.forbiddenAccess();
});


