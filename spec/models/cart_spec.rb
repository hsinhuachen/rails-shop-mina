require 'rails_helper'

RSpec.describe Cart, type: :model do
	describe "購物車基本功能" do
		it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
			cart = Cart.new
			cart.add_item 1

			expect(cart.empty?).to be false
		end
		it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
			cart = Cart.new

			3.times { cart.add_item(1) }
			4.times { cart.add_item(2) }
			5.times { cart.add_item(3) }

			expect(cart.items.length).to be 3
			expect(cart.items.first.quantity).to be 3
			expect(cart.items.second.quantity).to be 4
		end
		it "商品可以放到購物車裡，也可以再拿出來" do
			cart = Cart.new

			p1 = Product.create(title: "Product 1", price: 100)
			p2 = Product.create(title: "Product 2", price: 200)

			4.times { cart.add_item(p1.id) }
			3.times { cart.add_item(p2.id) }

			expect(cart.items.first.product_id).to be p1.id
	        expect(cart.items.second.product_id).to be p2.id
	        expect(cart.items.first.product).to be_a Product
		end
		it "商品可以移出購物車" do
			cart = Cart.new
			cart.add_item 2
			cart.remove_item 1

			expect(cart.items.length).to be 1
		end
		it "如果購物車數量剩1的時候, 商品移出購物車時, 清空購物車" do
			# cart = Cart.new
			# cart.add_item 1
			# cart.remove_item 1

			# expect(cart.items.length).to be 0
		end
		
		it "特別活動可能可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百）"
	end

	describe "購物車進階功能" do
      it "可以將購物車內容轉換成 Hash，存到 Session 裡" do
      	cart = Cart.new
      	3.times { cart.add_item(2) }
		4.times { cart.add_item(5) }

		expect(cart.serialize).to eq session_hash
      end
      it "可以把 Session 的內容（Hash 格式），還原成購物車的內容" do
      	cart = Cart.from_hash(session_hash)

        expect(cart.items.first.product_id).to be 2
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.product_id).to be 5
        expect(cart.items.second.quantity).to be 4
      end
    end

    private
    def session_hash
      {
        "items" => [
          {"product_id" => 2, "quantity" => 3},
          {"product_id" => 5, "quantity" => 4}
        ]
      }
    end
end
