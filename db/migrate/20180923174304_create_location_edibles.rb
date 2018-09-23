class CreateLocationEdibles < ActiveRecord::Migration[5.2]
  def change
    create_table :location_edibles do |t|
      
      t.integer :edible_id
	  t.integer :location_id


      t.timestamps null: false
    end
  end
end
