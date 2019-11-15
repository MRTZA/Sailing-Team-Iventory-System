class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :checked_out
      t.string :user
      t.datetime :date
      t.string :condition

      t.timestamps
    end
  end
end
