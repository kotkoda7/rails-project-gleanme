class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.float :lat
  	  t.float :lng
      t.string :loc_type
  	  t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
