class Category < ApplicationRecord

	belongs_to :locations
	belongs_to :edibles
end
