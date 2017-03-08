class Blog < ApplicationRecord
	has_many :posts
	has_many :owners
	has_many :messages, :through => :posts
	has_many :users, :through => :owners
end
