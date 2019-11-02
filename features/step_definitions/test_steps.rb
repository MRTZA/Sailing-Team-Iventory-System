#Given(/^X$/) do
#  puts "X?"
#end
#
#Then(/^Y$/) do |index|
#  @item.should == "stuff"
#end


When(/^I go to the homepage$/) do
  visit "/"
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Sailing Team Inventory")
end