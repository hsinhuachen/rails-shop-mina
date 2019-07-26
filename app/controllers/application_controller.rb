class ApplicationController < ActionController::Base
	before_action :init_cart
	include CartsHelper

	add_breadcrumb "首頁", :root_path

	private
	def init_cart
		@cart = Cart.from_hash(session[:cart1111])
	end
end
