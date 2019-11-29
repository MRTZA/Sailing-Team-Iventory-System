Feature: User_Login
	As a User
	I want to be able to login
	So that I can read the database

	Scenario: New User visits welcome page
		When I go to the welcome page
		Then I should see the sign-in option
		Then I should see the sign-up option
		Then I should see the forgot password option
		
	Scenario: New User tries to sign-in
		When I try to sign-in
		Then I should fail
		
	Scenario: New User creates new account
		When I click sign-up
		Then I should see the sign-up page
		Then I should be able to make a new user account
		Then I should be able to sign in with the account
		
	