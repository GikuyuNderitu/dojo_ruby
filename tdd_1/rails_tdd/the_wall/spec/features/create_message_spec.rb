require "rails_helper"

feature "user's ability to create a message" do
	before(:each) do
		visit "/"
		fill_in "user_username", with: "D2theAcademik"
		click_button "Sign In"
	end

	scenario "user inputs valid message information" do
		fill_in "message_message", with: "This is some darn good valid data, ya heard?!"
		click_button "Post a Message"
		expect(current_path).to eq('/messages')
		within('div.messages') {expect(page).to have_content "This is some darn good valid data, ya heard?!"}
	end

	scenario "user inputs invalid message" do
		fill_in "message_message", with: "tooshort"
		click_button "Post a Message"
		expect(current_path).to eq('/messages')
		expect(page).to have_content "Message is too short"
	end
end
