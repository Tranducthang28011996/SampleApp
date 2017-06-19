class Product < ApplicationRecord
	belongs_to :subcategory
	mount_uploader :image, ImageUploader
	has_many :order_items

	# scope :chosen, -> { where(selected: true) }
end
