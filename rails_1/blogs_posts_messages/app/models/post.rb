class Post < ApplicationRecord
  has_many :messages
  belongs_to :blog
  belongs_to :user
end
