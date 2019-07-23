require 'rails_helper'

RSpec.describe CartItem, type: :model do
	it "每個 Cart Item 都可以計算它自己的金額（小計）" do
		cart = Cart.new

		p1 = Product.create(title: "Product 1", price: 100)
		p2 = Product.create(title: "Product 2", price: 200)

		3.times { cart.add_item(p1.id) }
		5.times { cart.add_item(p2.id) }

		expect(cart.items.first.price).to be 300
		expect(cart.items.second.price).to be 1000
	end
	it "可以計算整台購物車的總消費金額" do
		cart = Cart.new

		p1 = Product.create(title: "Product 1", price: 100)
		p2 = Product.create(title: "Product 2", price: 200)

		3.times { cart.add_item(p1.id) }
		5.times { cart.add_item(p2.id) }

		expect(cart.total_price).to be 1300
	end
	it "在購物車移除相同種類的商品後可以得到更新後金額" do
		cart = Cart.new

		p1 = Product.create(title: "Product 1", price: 100)
		p2 = Product.create(title: "Product 2", price: 200)

		3.times { cart.add_item(p1.id) }
		5.times { cart.add_item(p2.id) }
		cart.remove_item(p1.id)
		1.times { cart.remove_item(p2.id) }

		expect(cart.items.first.price).to be 200
		expect(cart.items.second.price).to be 800
	end
	it "在購物車移除相同種類的商品後, 計算整台購物車的總消費金額" do
		cart = Cart.new

		p1 = Product.create(title: "Product 1", price: 100)
		p2 = Product.create(title: "Product 2", price: 200)

		3.times { cart.add_item(p1.id) }
		5.times { cart.add_item(p2.id) }
		cart.remove_item(p1.id)
		1.times { cart.remove_item(p2.id) }

		expect(cart.total_price).to be 1000
	end
end
