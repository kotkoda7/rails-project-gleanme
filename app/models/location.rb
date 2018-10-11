class Location < ApplicationRecord

	belongs_to :user, optional: true
	has_many :edible_categories
	has_many :edibles, through: :edible_categories

	validates :address, presence: true
  	validates :description, presence: true
	
end
