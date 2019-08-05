class RecipesController < ApplicationController
  	add_breadcrumb "食譜", :recipes_path

	def index
		@posts = Recipe.where(publish: true)
		@tags = Tag.all
	end

	def show
		@post = Recipe.find(params[:id])
		add_breadcrumb @post.title, recipe_path(params[:id])
	end
end
