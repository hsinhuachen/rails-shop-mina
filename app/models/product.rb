class Product < ApplicationRecord
	validates :title, presence: true
	belongs_to :category
	mount_uploader :image, ImageUploader
	store :spec, accessors: [ :color, :homepage ], coder: JSON

	default_scope -> { order('sorting DESC') }
end
