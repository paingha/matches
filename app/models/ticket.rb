class Ticket < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :message, presence: true
  
  has_many :comments, as: :commentable
  has_many :users, through: :comments
end
