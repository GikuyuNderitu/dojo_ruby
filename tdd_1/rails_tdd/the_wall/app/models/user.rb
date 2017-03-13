class User < ApplicationRecord
	validates :username, :presence => true
	validates :username, :length => {minimum: 6}
	validates :username, :uniqueness => true
end
