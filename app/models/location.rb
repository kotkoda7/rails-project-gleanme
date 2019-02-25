class Location < ApplicationRecord

	belongs_to :user, optional: true

	has_many :edibles, through: :edible_locations
	has_many :edible_locations
	accepts_nested_attributes_for :edibles
	accepts_nested_attributes_for :edible_locations
	

	validates :address, presence: true
  	validates :description, presence: true
	
end
