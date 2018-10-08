class EdibleCategory < ApplicationRecord
	belongs_to :edibles
	belongs_to :locations
end
