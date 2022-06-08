class ReviewFlavor < ApplicationRecord
  belongs_to :flavor
  belongs_to :review
end
