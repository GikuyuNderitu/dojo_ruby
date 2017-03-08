class User < ApplicationRecord
	has_many :owners, :posts, :messages
	has_many :blogs, through: :owners

	validates :first_name, :last_name, :email_address, presence: true
end
