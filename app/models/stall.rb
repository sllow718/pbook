class Stall < ApplicationRecord
  belongs_to :user
  belongs_to :hawker_center
  has_many :dishes, dependent: :destroy
  has_one_attached :photo


end
