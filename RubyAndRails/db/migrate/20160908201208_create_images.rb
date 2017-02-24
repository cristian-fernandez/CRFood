class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :idFood
      t.binary :image
      t.boolean :mainimage

      t.timestamps null: false
    end
  end
end
