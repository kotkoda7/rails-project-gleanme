class Edible < ApplicationRecord

	has_many :locations, through: :edible_locations
	has_many :edible_locations
	accepts_nested_attributes_for :edible_locations

end
