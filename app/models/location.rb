class Location < ApplicationRecord
	has_many :location_edibles, through: :edibles
	has_many :location_edibles
	belongs_to :user, required: false


	
end
