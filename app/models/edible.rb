class Edible < ApplicationRecord

	has_many :locations, through: :edible_categories
	has_many :edible_categories

end
