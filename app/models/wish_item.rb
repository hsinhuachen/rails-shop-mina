class WishItem
	attr_reader :product_id, :quantity

	def initialize(product_id,quantity=1)
		@product_id = product_id
		@quantity = quantity
	end

	def remove_wish(n = 1)
		@quantity -= n
	end
end