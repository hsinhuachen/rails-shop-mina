class WelcomeController < ApplicationController
	def index
		@cycle = Home.where(publish: true)
		@products = Product.where(publish: true, latest: true).limit(3)
	end
end
