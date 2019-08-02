class Ingredient < ApplicationRecord
	validates :title, presence: true
	belongs_to :recipe
end
