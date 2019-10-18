class CreateInventory < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.text :description
      t.integer :quantity
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
