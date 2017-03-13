require "rails_helper"

feature "user should be able to log out" do
	scenario "user clicks logout button" do
		visit "/"
		fill_in "user_username", with: "D2theAcademik"
		click_button "Sign In"
		find("#logout").click
		expect(current_path).to eq('/')
		# Verify that user can't navigate to other parts of the site
		visit '/messages'
		expect(current_path).to eq('/')
	end
end
