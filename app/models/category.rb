class Category < ApplicationRecord
	has_many :products
	default_scope -> { order('sorting DESC') }
end
