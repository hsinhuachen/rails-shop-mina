class Product < ApplicationRecord
	validates :title, presence: true
	belongs_to :category
	mount_uploader :image, ImageUploader

	# default_scope -> { order('sorting DESC') }
end
