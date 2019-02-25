class EdibleLocation < ApplicationRecord

	belongs_to :location
	belongs_to :edible
	accepts_nested_attributes_for :location
	accepts_nested_attributes_for :edible

end
