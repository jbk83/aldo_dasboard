class Store < ApplicationRecord
  has_many :item, through: :store_items

  validates :name, presence: true
end
