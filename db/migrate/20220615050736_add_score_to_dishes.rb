class AddScoreToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :score, :float, default: 0
  end
end
