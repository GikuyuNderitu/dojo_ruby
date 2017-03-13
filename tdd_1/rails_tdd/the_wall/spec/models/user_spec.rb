require 'rails_helper'

RSpec.describe User, type: :model do
	context "User provides a valid login" do
		it "can log in successfully" do
			expect(build(:user)).to be_valid
		end
	end

	context "User does not provid valid login information" do
		it "did not provide username" do
			expect(User.new).to be_invalid
		end

		it "did not provide a username longer than 5 characters" do
			expect(build(:user, username: "D2the")).to be_invalid
		end

		it "did not provide a unique Username" do
			create(:user)
			expect(build(:user)).to be_invalid
		end
	end
end
