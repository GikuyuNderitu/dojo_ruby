require 'rails_helper'

RSpec.describe User, type: :model do
	context "With valid fields" do
		it "should save" do
			expect(build(:user)).to be_valid
		end
	end

	context "With invalid fields" do
		it "should not save if the first_name field is blank" do
			expect(build(:user, first_name:"")).to be_invalid
		end

		it "should not save if the last_name field is blank" do
			expect(build(:user, last_name: "")).to be_invalid
		end

		it "should not save if the email already exists in the database" do
			create(:user)
			expect(build(:user)).to be_invalid
		end

		it "should not save if the email is formatted incorrectly" do
			expect(build(:user, email: "examplemail.com")).to be_invalid
		end
	end
end
