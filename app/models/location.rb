class Location < ApplicationRecord
	has_many :location_edibles
	has_many :edibles, through: :location_edibles
	
	belongs_to :user, required: false


	
end
