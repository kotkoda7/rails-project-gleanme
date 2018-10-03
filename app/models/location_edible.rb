class LocationEdible < ApplicationRecord
  belongs_to :location
  belongs_to :edible
end
