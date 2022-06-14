class HawkerCenter < ApplicationRecord
  has_many :stalls, dependent: :destroy
  include PgSearch::Model

end
