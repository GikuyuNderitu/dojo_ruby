require 'rails_helper'

RSpec.describe Comment, type: :model do
	context "Valid comment data is supplied" do
		before(:each) do
			@user = User.create(username: "Gikuyu")
		end
		it "has been provided sufficent comment data" do
			expect(build(:comment, user: @user)).to be_valid
		end
	end

	context "Invalid comment data is supplied" do
		before(:each) do
			@user = User.create(username: "Gikuyu")
		end

		it "was not provided with a user" do
			expect(build(:comment)).to be_invalid
		end

		it "was not appended to a message" do
			expect(build(:comment, message: nil, user: @user)).to be_invalid
		end

		it "did not provide enough characters to be a valid comment" do
			expect(build(:comment, comment: "Too short", user: @user)).to be_invalid
		end
	end
end
