class Cart
	attr_reader :items

	def initialize(items = [])
     	@items = items
    end

	def add_item(product_id,quantity = 1)
		found_item = items.find {|item| item.product_id == product_id}

		if found_item
			found_item.increment(quantity)
		else
			new_item = CartItem.new(product_id)
			@items << new_item

			if quantity > 1
				quantity -= 1
				new_item.increment(quantity)
			end
		end
	end

	def remove_item(product_id)
		found_item = items.find {|item| item.product_id == product_id}

		@items.delete(found_item)
	end

	def remove_quantity(product_id)
		found_item = items.find {|item| item.product_id == product_id}

		if found_item
			found_item.decrease
		end
	end

	def total_price
		items.reduce(0) { |sum, item| sum + item.price } 
	end

	def shipping
		if total_price < 2000
			150
		else
			0
		end
	end

	def final_price
		total_price + shipping
	end

	def empty?
		@items.empty?
	end

	def serialize
		all_items = items.map { |item|
        	{ "product_id" => item.product_id, "quantity" => item.quantity}
      	}

      { "items" => all_items }
	end

	def self.from_hash(hash)
		if hash.nil?
	        new []
		else
			new hash["items"].map { |item_hash|
			  CartItem.new(item_hash["product_id"], item_hash["quantity"])
			}
		end
	end
end