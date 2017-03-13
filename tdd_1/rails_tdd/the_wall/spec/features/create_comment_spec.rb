require "rails_helper"

feature "user's ability to create a message" do
	before(:each) do
		visit "/"
		fill_in "user_username", with: "D2theAcademik"
		click_button "Sign In"
		fill_in "message_message", with: "This is some darn good valid data, ya heard?!"
		click_button "Post a Message"
	end

	scenario "user inputs valid message information" do
		fill_in "comment_comment", with: "This is a wicked awesome comment breh!"
		click_button "Leave Comment"
		expect(current_path).to eq('/messages')
		within('div.comment-box') {expect(page).to have_content "This is a wicked awesome comment breh!"}
	end

	scenario "user inputs invalid message" do
		fill_in "comment_comment", with: "tooshort"
		click_button "Leave Comment"
		expect(current_path).to eq('/messages')
		expect(page).to have_content "Comment is too short"
	end
end
