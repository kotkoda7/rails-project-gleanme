class Location < ApplicationRecord

	belongs_to :user, optional: true

	has_many :edibles, through: :location_edibles
	has_many :location_edibles
	accepts_nested_attributes_for :edibles
	

	validates :address, presence: true
  	validates :description, presence: true
	
end
