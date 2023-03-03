import { addCucumberPreprocessorPlugin } from '@badeball/cypress-cucumber-preprocessor';
import browserify from '@badeball/cypress-cucumber-preprocessor/browserify';
import { defineConfig } from 'cypress';

async function setupNodeEvents(on: Cypress.PluginEvents, config: Cypress.PluginConfigOptions) : Promise<Cypress.PluginConfigOptions> {
  const cucumber = require('cypress-cucumber-preprocessor').default
  const browserify = require('@cypress/browserify-preprocessor');
  const options = {
    ...browserify.defaultOptions,
    typescript: require.resolve('typescript'),
  };
  on('file:preprocessor', cucumber(options));
  
  
  return config
};

export default defineConfig({
    viewportWidth: 1920,
    viewportHeight: 1080,
    defaultCommandTimeout: 30000,
    chromeWebSecurity: false,
    numTestsKeptInMemory: 5,
    retries: {
      runMode: 1,
      openMode: 0,
    },
    video: false,
    e2e: {
      specPattern: [
        './cypress/integration/*.{feature,features}',
      ],
      baseUrl: 'http://www.google.com',
      setupNodeEvents,
      experimentalMemoryManagement: true,
      env: {
                grepFilterSpecs: true
      }
    },
  });