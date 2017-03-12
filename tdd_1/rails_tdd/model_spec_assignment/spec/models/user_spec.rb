require 'rails_helper'

RSpec.describe User, type: :model do
	# pending "add some examples to (or delete) #{__FILE__}"

	context "With valid attributes" do
		it "should save" do
			user = User.new(
				first_name: 'Lydia',
				last_name: 'Nderitu',
				email: 'Llady@gmail.com'
			)

			expect(user).to be_valid
		end
	end

	context "With invalid attributes" do
		before(:each) do
			@user = User.new
		end

		it "has invalid first_name" do
			@user.last_name = 'Nderitu'
			@user.email = 'Llady@gmail.com'
			expect(@user).to be_invalid
		end

		it "does not have an invalid first_name" do
			@user.last_name = 'Nderitu'
			@user.email = 'Llady@gmail.com'
			expect(@user).to be_invalid
		end

		it "does not have an invalid last_name" do
			@user.first_name = 'Lydia'
			@user.email = 'Llady@gmail.com'
			expect(@user).to be_invalid
		end

		it "does not have an invalid email" do
			@user.first_name = 'Lydia'
			@user.last_name = 'Nderitu'
			@user.email = 'Lladygmail.com'
			expect(@user).to be_invalid
		end

		it "doest cannot save if an email already exists" do
			User.create(first_name:"Paul", last_name:"Raymond", email:"Llady@gmail.com")
			@user.first_name = 'Lydia'
			@user.last_name = 'Nderitu'
			@user.email = 'Llady@gmail.com'
			expect(@user).to be_invalid
		end
	end
end
