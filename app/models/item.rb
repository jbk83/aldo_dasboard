class Item < ApplicationRecord
  has_many :store, through: :store_items

  validates :name, presence: true
end
