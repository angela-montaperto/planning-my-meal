class CreateFoodGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :food_groups do |t|
      t.string :group_name, null: false
      t.string :name, null: false
      t.string :code
      t.timestamps
    end

  end

end
