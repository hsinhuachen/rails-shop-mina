class Wish
	attr_reader :items
	
	def initialize
		@items = []
	end

	def add_wish(product_id, user_id)
		Wish.create(product_id: product_id, user_id: user_id)
	end

	def empty?
		@items.empty?
	end
end