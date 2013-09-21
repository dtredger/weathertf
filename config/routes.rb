WeatherPing::Application.routes.draw do

	resources :users

	resources :sessions, only: [:new, :create, :delete]


	put 'sms', to: 'users#sms'


	root to: 'users#index'

  mount Resque::Server, at: '/resque'


end
