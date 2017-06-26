require 'elasticsearch/model'
class Product < ApplicationRecord
	belongs_to :subcategory
	mount_uploader :image, ImageUploader
	has_many :order_items
  has_many :users
  has_many :reviews
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
	# scope :chosen, -> { where(selected: true) }
  
end
Product.import force: true
