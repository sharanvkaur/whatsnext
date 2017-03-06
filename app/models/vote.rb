class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validates :user_id, uniqueness: { scope: :collection_id }
end
