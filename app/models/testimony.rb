class Testimony < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :text, presence: true
end
