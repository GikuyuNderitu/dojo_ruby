class User < ApplicationRecord
	has_many :comments, :as => :commentable
	has_many :owners
	has_many :posts
	has_many :messages
	has_many :blogs, :through => :owners
end
