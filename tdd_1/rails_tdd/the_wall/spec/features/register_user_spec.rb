require 'rails_helper'

feature "guest user will be able to create an account" do
	before(:each) do
		visit "/"
	end
	scenario "guest inputs a valid username" do
		fill_in "user_username", with: "D2theAcademik"
		click_button "Sign In"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Welcome, D2theAcademik"
	end

	scenario "guest inputs an invalid username" do
		fill_in "user_username", with: "short"
		click_button "Sign In"
		expect(current_path).to eq("/")
		expect(page).to have_content "Username is too short"
	end

	scenario "guest does not input a username" do
		click_button "Sign In"
		expect(current_path).to eq("/")
		expect(page).to have_content "Username can't be blank"
	end
end
