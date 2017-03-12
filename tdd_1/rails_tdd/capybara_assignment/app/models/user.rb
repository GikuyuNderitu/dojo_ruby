class User < ApplicationRecord
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :first_name, :last_name, :presence => true
	validates :email, :uniqueness => true
	validates :email, :format => {with: EMAIL_REGEX, message: "Must have a valid email (eg. example@example.com)"}
end
