Rails.application.routes.draw do
	root 'products#index'

	resources :products, only: [:index, :show]

	resource  :cart, only: [:show, :destroy] do
	  	collection do
	  		put :add, path: "add/:id"
	  		put :remove, path: "remove/:id"
	  		put :increase, path: "increase/:id"
	  		put :reduce, path: "reduce/:id"
	  		get :checkout
	  	end
	end
end
