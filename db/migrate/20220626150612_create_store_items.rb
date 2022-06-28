class CreateStoreItems < ActiveRecord::Migration[7.0]
  def change
    create_table :store_items do |t|
      t.integer :inventory, null: false
      t.belongs_to :store, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.timestamps
    end
  end
end
