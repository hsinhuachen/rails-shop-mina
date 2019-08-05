require 'rails_helper'

RSpec.describe Product, type: :model do
	describe "將商品加入期望清單功能" do
	  it "可以把商品丟到期望清單裡面" do
	  	# user_id = 2
	  	# product_id = 1
	  	# add_wish(1,2)

		# expect(wish.empty?).to be false
	  end

	  it "如果加了相同種類的商品丟到期望清單, 則會移出期望清單" do
	  	# wish = Wish.new
	  	# 2.times { wish.add_wish 1 }

	  	# expect(wish.empty?).to be true
	  end
  	end

end
