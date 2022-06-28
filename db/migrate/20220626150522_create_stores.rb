class CreateStores < ActiveRecord::Migration[7.0]
  def change
    enable_extension("citext")
    
    create_table :stores do |t|
      t.citext :name, null: false

      t.timestamps
    end
  end
end
