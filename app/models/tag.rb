class Tag < ApplicationRecord
	has_many :taggings
	has_many :recipes, through: :taggings

	validates :name, presence: true

	default_scope -> { order('sorting DESC') }

	def tag_title
		@name = Tag.find(1)
	end
end
