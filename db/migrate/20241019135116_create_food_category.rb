class CreateFoodCategory < ActiveRecord::Migration[7.1]
  def change
    create_table :food_categories do |t|
      t.string :name, null: false
      t.references :food_group
      t.timestamps
    end
  end
end
