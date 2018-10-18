class Edible < ApplicationRecord

	has_many :locations, through: :categories
	has_many :categories

end
