Feature: Identity Management
  In order to authenticate with external services
  As a user
  I want to be able to pick my preferred authentication method

  Scenario: Setting up a new identity
    When an identity, user1, begins creation with the email user1@deranged.dk
    Then an email is sent to user1@deranged.dk with an authentication code X
    When user1 verifies the creation with authentication code X
    Then an identity, user1, exists with the email user1@deranged.dk
