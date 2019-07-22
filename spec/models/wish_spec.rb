require 'rails_helper'

RSpec.describe Wish, type: :model do
	it "可以將商品加入追蹤清單" do
		wish = Wish.new
		wish.add_item 1
		expect(wish.empty?).to be false
	end
	it "如果加了相同商品進入追蹤清單, 便會移出追蹤清單" do
		wish = Wish.new

		2.times { wish.add_item(1) }
		wish.add_item(2)

		expect(wish.items.length).to be 2
	end
end
