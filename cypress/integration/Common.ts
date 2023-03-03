/// <reference types="cypress" />


class Common {

    static goToLoginPage() {
        cy.visit("/This should be the url of the internal page");
    }

    static enterValidLoginData() {
        cy.get("#username").type(Cypress.env("username"));
        cy.get("#password").type(Cypress.env("password"));
        cy.contains('Login').should('be.visible').click();
    }


    static enterInValidLoginData(user: string,pass: string) {
        cy.get("#username").type(user);
        cy.get("#password").type(pass);
        cy.contains('Login').should('be.visible').click();
    }

    static forbiddenAccess(){
        cy.contains('Error').should('be.visible');
    }

    static allowedAcess(){
        cy.contains('Welcome').should('be.visible');
    }
}

export default Common