/
class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
/
class CreateInventory < ActiveRecord::Migration
  def change
    create_table :inventory do |t|
      t.string :item
      t.integer :checked_out
      t.integer :total
      t.integer :remaining
      t.timestamps
    end
  end
end