# Matching users, joining table
class Match < ApplicationRecord
	belongs_to :giver, class_name: 'User'
	belongs_to :receiver, class_name: 'User'
end
