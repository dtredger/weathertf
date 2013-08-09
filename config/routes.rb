Weathertf::Application.routes.draw do

	resources :users


	get 'sms', to: 'users#sms'


	root to: 'users#index'


end
