class AddImagetoDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :image, :text, default: "https://asianinspirations.com.au/wp-content/uploads/2019/11/R1018-PisangGoreng-new-619x412.jpg"
  end
end
