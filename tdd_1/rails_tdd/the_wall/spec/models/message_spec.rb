require 'rails_helper'

RSpec.describe Message, type: :model do
	context "User provides a valid message build" do
		it "can be created with valid input" do
			expect(build(:message)).to be_valid
		end
	end

	context "invalid message is built" do
		it "can't be created without a user" do
			expect(build(:message, user: nil)).to be_invalid
		end

		it "can't be created with a message length shorter than 11 characters" do
			expect(build(:message, message: "Too short!")).to be_invalid
		end
	end
end
