class AddLocationRefToEdibleCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :edible_categories, :location, foreign_key: true
  end
end
