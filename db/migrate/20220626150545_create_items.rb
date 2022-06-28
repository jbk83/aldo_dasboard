class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.citext :name, null: false

      t.timestamps
    end
  end
end
