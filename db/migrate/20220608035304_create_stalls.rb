class CreateStalls < ActiveRecord::Migration[6.1]
  def change
    create_table :stalls do |t|
      t.string :name
      t.text :description
      t.string :unit
      t.references :user, null: false, foreign_key: true
      t.references :hawker_center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
