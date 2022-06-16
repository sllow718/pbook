class AddCoordinatesToHawkerCenter < ActiveRecord::Migration[6.1]
  def change
    add_column :hawker_centers, :latitude, :float
    add_column :hawker_centers, :longitude, :float
  end
end
