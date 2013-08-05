Weathertf::Application.routes.draw do

	resources :users


	# get 'users/display/:id' to: 'users#display_location', as: :post


	root to: 'users#index'


end
