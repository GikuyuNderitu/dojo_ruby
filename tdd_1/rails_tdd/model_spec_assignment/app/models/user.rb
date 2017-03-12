class User < ApplicationRecord
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :first_name, :last_name, :email, :presence => true
	validates :email, :format => {with: EMAIL_REGEX, message: "Must be a valid email (eg. 'example@mail.com')"}
	validates :email, :uniqueness => true
end
