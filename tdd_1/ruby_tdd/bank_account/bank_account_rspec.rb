require_relative 'bank_account'
RSpec.describe BankAccount do
	before(:each) do
		@b1 = BankAccount.new
		@b2 = BankAccount.new
		@b1.deposit 40, 'savings'
		@b2.deposit 20, 'checking'
	end

	it "has method for retrieving the checking account balance" do
		expect(@b1.get_checking).to eq(0)
		expect(@b2.get_checking).to eq(20)
	end

	it "has a getter method that retrieves the total account balance" do
		expect(@b1.display_balance).to eq(40)
		expect(@b2.display_balance).to eq(20)
	end

	it "has a function that allows the user to withdraw class" do
		@b1.withdraw 5, 'savings'
		@b2.withdraw 20, 'checking'
		expect(@b1.get_savings).to eq(35)
		expect(@b2.get_checking).to eq(0)
	end

	it "raises an error if a user tries to withdraw more money than they have in the account" do
		expect{@b1.withdraw 41, 'savings'}.to raise_error(Withdraw_Exception)
		expect{@b2.withdraw 21, 'checking'}.to raise_error(Withdraw_Exception)
	end

	it "raises an error when the user attempts to call the getter method for the number of bank accounts there are" do
		expect{@b1.no_of_accounts}.to raise_error(NoMethodError)
	end

	it "raises an error when the user attempts to set the interest rate" do
		expect{@b1.interest_rate = 20}.to raise_error(NoMethodError)
	end
end
