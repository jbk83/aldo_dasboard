class StoreItem < ApplicationRecord
  belongs_to :store
  belongs_to :item

  validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
