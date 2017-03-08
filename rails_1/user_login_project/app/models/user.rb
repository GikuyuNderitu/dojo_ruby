class User < ApplicationRecord
	validates :first_name, :last_name, :age, :email, presence: true
	validates :first_name, :last_name, length: {in: 2..255}
	validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 150}
end
