class AddEdibleRefToEdibleCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :edible_categories, :edible, foreign_key: true
  end
end
