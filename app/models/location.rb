class Location < ApplicationRecord
	
	has_many :location_edibles
	has_many :edibles, through: :location_edibles
	accepts_nested_attributes_for :edibles

	belongs_to :user

	validates :address, presence: true
  	validates :description, presence: true
	
end
