WeatherPing::Application.routes.draw do

	resources :users

	resources :sessions, only: [:new, :create, :delete]


	get 'sms', to: 'users#sms'


	root to: 'users#index'


end
