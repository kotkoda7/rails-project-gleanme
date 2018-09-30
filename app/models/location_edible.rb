class LocationEdible < ApplicationRecord
  belongs_to :location, required: false
  belongs_to :edible, required: false
end
