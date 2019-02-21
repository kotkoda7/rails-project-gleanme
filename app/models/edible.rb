class Edible < ApplicationRecord

	has_many :locations, through: :location_edibles
	has_many :location_edibles
	accepts_nested_attributes_for :location_edibles

end
