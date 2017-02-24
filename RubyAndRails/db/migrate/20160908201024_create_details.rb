class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :idFood
      t.string :description
      t.string :ingredients
      t.string :directions
      t.string :history

      t.timestamps null: false
    end
  end
end
