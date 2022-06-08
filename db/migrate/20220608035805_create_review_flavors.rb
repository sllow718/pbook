class CreateReviewFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :review_flavors do |t|
      t.references :flavor, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
