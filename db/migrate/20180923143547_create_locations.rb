class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :edible
      t.float :lat
  	  t.float :lng
      t.integer :user_id
      t.string :loc_type
  	  t.text :description

      t.timestamps null: false
    end
  end
end
