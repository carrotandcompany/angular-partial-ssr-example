import { getGreeting } from '../support/app.po';

describe('frontend', () => {
  beforeEach(() => cy.visit('/'));

  it('should display welcome message', () => {
    getGreeting().contains('Welcome to frontend!');
  });
});
