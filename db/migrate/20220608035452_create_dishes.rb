class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :dish_type
      t.references :stall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
