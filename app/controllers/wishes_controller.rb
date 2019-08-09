class WishesController < ApplicationController
	def show
		@posts = current_user.products
	end

	def add
		@wish = Wish.new(product_id: params[:id], user_id: params[:user_id])
		@wish.save
		redirect_back fallback_location: root_path, notice: '已加入希望清單'
	end

	def remove
		@wish = Wish.find_by(product_id: params[:id], user_id: params[:user_id]) 
		@wish.destroy
		redirect_back fallback_location: root_path, notice: '已移出希望清單'
	end
end