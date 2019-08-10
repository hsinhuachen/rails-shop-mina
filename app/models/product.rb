class Product < ApplicationRecord
	validates :title, presence: true
	belongs_to :category
	has_many :wishes
	has_many :users, through: :wishes
	mount_uploader :image, ImageUploader
	store :spec, accessors: [ :color, :homepage ], coder: JSON

	default_scope -> { order('sorting DESC') }

	def checkwish(user_id,product_id)
		find_wish = Wish.find_by(product_id: product_id, user_id: user_id)
	end
end
