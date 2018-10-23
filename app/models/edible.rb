class Edible < ApplicationRecord

	has_many :locations, through: :edible_locations
	has_many :edible_locations

end
