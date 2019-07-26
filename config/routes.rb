Rails.application.routes.draw do
	root 'welcome#index'

	resources :products, only: [:index, :show]
  	get "/products/category/:id", to: "products#index", :as => :category

	resource  :cart, only: [:show, :destroy] do
	  	collection do
	  		put :add, path: "add/:id"
	  		put :remove, path: "remove/:id"
	  		put :increase, path: "increase/:id"
	  		put :reduce, path: "reduce/:id"
	  		get :checkout
	  	end
	end

	# resources :categories

	# end
end
