class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :disprice
      t.string :trademark
      t.string :size
      t.text :description
      t.string :color
      t.string :image
      t.integer :total

      t.timestamps
    end
  end
end
