class AddFlavorToDishes < ActiveRecord::Migration[6.1]
  def change
    add_reference :dishes, :flavor, null: true, foreign_key: true
  end
end
