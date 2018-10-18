class Location < ApplicationRecord

	belongs_to :user, optional: true
	has_many :categories
	has_many :edibles, through: :categories

	validates :address, presence: true
  	validates :description, presence: true
	
end
