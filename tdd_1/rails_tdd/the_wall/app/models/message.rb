class Message < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :message, :length => {minimum: 11}
end
