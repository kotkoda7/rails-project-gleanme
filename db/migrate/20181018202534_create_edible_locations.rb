class CreateEdibleLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :edible_locations do |t|
    	t. integer :edible_id
    	t. integer :location_id

      t.timestamps

      t.index ["edible_id"], name: "index_edible_locations_on_edible_id"
    end
  end
end
