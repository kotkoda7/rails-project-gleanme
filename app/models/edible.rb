class Edible < ApplicationRecord

	has_many :locations, through: :location_edibles
	has_many :location_edibles

end
