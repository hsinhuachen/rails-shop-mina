class RecipeController < ApplicationController
	def index
		@posts = Recipe.where(publish: true)
	end
end
