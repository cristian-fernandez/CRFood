class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :idType
      t.integer :averageRating
      t.string :language

      t.timestamps null: false
    end
  end
end
