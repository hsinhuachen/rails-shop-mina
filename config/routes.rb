Rails.application.routes.draw do
	root 'products#index'

	resources :products, only: [:index, :show]

	resource	:cart, only: [:show, :destroy] do
	  	collection do
	  		put :add, path: "add/:id"
	  		get :checkout
	  	end
	end
end
