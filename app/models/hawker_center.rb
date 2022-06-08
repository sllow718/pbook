class HawkerCenter < ApplicationRecord
  has_many :stalls, dependent: :destroy
end
