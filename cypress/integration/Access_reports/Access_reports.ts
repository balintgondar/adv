/// <reference types='cypress' />

import { Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import Common from '../Common';

Given('Navigate to internal site', () => {
    Common.goToLoginPage();
});

Given('Login with authorized user', () => {
    Common.enterValidLoginData();
});

Then('The site has been loaded',() =>{
    Common.allowedAcess();
})