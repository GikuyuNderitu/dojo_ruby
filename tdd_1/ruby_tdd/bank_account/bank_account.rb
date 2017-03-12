require_relative "banking_exceptions"

class BankAccount
	@@no_of_accounts = 0
	def initialize
		@acc_number = gen_account_num
		@interest_rate = 0.01
		@checking_balance = 0
		@saving_balance = 0
		@@no_of_accounts += 1
		puts "Created account #{@@no_of_accounts}"
		self
	end

	def get_checking
		@checking_balance
	end

	def get_savings
		@saving_balance
	end

	def deposit moniez, account
		if account.downcase == 'savings'
			self.deposit_sav moniez
		elsif account.downcase == 'checking'
			self.deposit_check moniez
		else
			raise ArgumentError.new("The account type must be either savings or checking")
		end
		self
	end

	def withdraw moniez, account
		if account.downcase == 'savings'
			self.withdraw_sav moniez
		elsif account.downcase == 'checking'
			self.withdraw_check moniez
		else
			raise ArgumentError.new("The account type must be either savings or checking")
		end
		self
	end

	def account_number
		@acc_number
	end

	def display_balance
		self.get_savings + self.get_checking
	end

	def account_information
		puts "Account Number: #{self.account_number}\n"\
		"Total Money: #{self.display_balance}\n"\
		"Checking Account Balance: #{self.get_checking}\n"\
		"Savings Account Balance: #{self.get_savings}\n"\
		"Interest Rate: #{@interest_rate}"

		self
	end

	protected
		def withdraw_check money
			if @checking_balance - money >= 0
				@checking_balance -= money
			else
				raise Withdraw_Exception, "Not enough money in your Checking Account you bum! Stop spending!"
			end
		end

		def withdraw_sav money
			if @saving_balance - money >= 0
				@saving_balance -= money
			else
				raise Withdraw_Exception, "Not enough money in your Savings Account. Better start investing in your future!"
			end
		end

		def deposit_check money
			@checking_balance += money
		end

		def deposit_sav money
			@saving_balance += money
		end
	private
		def withdraw_priv start, from
			if start - from >= 0
				return true
			else
				return false
			end
		end

		def gen_account_num
			(0..9).reduce("") {|memo, num|
				if (random_num % 2 == 0)
					memo += random_num.to_s
				else
					memo += random_char
				end
				memo
			}
		end

		def random_char
			(65+rand(26)).chr
		end

		def random_num
			rand(9)
		end
end

# b1 = BankAccount.new.deposit 1564, "checking"
# b1.deposit 1230, "savings"
#
# b2 = BankAccount.new.deposit 18, "checking"
#
# begin
# 	b1.withdraw 90, 'checking'
# 	b2.withdraw 90, 'checking'
# rescue Withdraw_Exception => msg
# 	puts msg
# end
#
# puts "Banking account 1"
# b1.account_information
# puts "Banking account 2"
# b2.account_information
