class AddNewuserToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :newuser, :string
  end
end
