class AddScoreToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :score, :float, default: 1.0
  end
end
