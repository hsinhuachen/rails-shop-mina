class Product < ApplicationRecord
	validates :title, presence: true
	belongs_to :category
	mount_uploader :image, ImageUploader

	def category_ids=(ids)

	end
end
