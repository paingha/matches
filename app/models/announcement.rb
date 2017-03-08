class Announcement < ApplicationRecord
  validates :text, presence: true
  validates :published, presence: true
end
