#Given(/^X$/) do
#  puts "X?"
#end
#
#Then(/^Y$/) do |index|
#  @item.should == "stuff"
#end


When(/^I go to the welcome page$/) do
  visit "/"
  click_on "Sign in"
end

Then(/^I should see the sign-in option$/) do
	expect(page).to have_content("Sign in")
end

Then(/^I should see the forgot password option$/) do
	expect(page).to have_content("Forgot password?")
end

Then(/^I should see the sign-up option$/) do
  expect(page).to have_content("Sign up")
end

#

When(/^I try to sign-in$/) do
  visit "/"
end

Then(/^I should fail$/) do
  click_on "Sign in"
  expect(page).to have_content("Sign in")
  find_field("Email").set("notauth@bademail.net")
  find_field("Password").set("swordfish")
  click_on "Sign in"
  expect(page).to have_content("Bad email or password.")
end

#

When(/^I click sign-up$/) do
  visit "/"
  click_on "Sign up"
end

Then(/^I should see the sign-up page$/) do
  expect(page).to have_content("Sign up")
end

Then(/^I should be able to make a new user account$/) do
  find_field("Email").set("newuser@goodemail.net")
  find_field("Username").set("Testman")
  find_field("Password").set("password")
  click_on "Sign up"
end

Then(/^I should be able to sign in with the account$/) do
  visit "/"
  find_field("Email").set("newuser@goodemail.net")
  find_field("Password").set("password")
  click_on "Sign in"
  expect(page).to have_content("All Inventory Items")
end