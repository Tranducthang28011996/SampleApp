class RemoveCategoryIdToSubcategories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :subcategories, :category_id, :string
  end
end
