require 'rails_helper'
feature "guest user creates an account" do
	before(:each) do
		visit '/users/new'
	end

	scenario "successfully creates a new user account" do
		fill_in "user_first_name", with: "Lydia"
		fill_in "user_last_name", with: "Nderitu"
		fill_in "user_email", with: "l9lady@gmail.com"
		click_button "Create User"
		expect(page).to have_content "Welcome, Lydia"
		expect(page).to have_current_path("/users/#{User.last.id}")
	end

	scenario "unsuccessfully creates a new user account" do
		click_button "Create User"
		expect(current_path).to eq('/users/new')
	end

	scenario "doesn't fill out the last_name field" do
		fill_in "user_last_name", with: "Nderitu"
		fill_in "user_email", with: "lydia@gmail.com"
		click_button "Create User"
		expect(page).to have_content("First name can't be blank")
	end

	scenario "doesn't fill out the last_name field" do
		fill_in "user_first_name", with: "Lydia"
		fill_in "user_email", with: "lydia@gmail.com"
		click_button "Create User"
		expect(page).to have_content("Last name can't be blank")
	end

	scenario "doesn't fill out email field correnctly" do
		fill_in "user_first_name", with: "Lydia"
		fill_in "user_last_name", with: "Nderitu"
		fill_in "user_email", with: "lydiagmail.com"
		click_button "Create User"
		expect(page).to have_content("Must have a valid email (eg. example@example.com)")
	end
end
