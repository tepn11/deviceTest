class Location < ApplicationRecord
	belongs_to :user
	has_many :friends, through: :user
end
