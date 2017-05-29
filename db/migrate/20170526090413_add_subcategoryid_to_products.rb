class AddSubcategoryidToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :subcategory_id, :integer
  end
end
