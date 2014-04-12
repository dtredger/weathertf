WeatherTF::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :delete]
  resources :password_resets, only: [:create, :edit, :update]

  #should password_resets be limited??

  put 'sms', to: 'users#sms'


  root to: 'users#index'

  mount Resque::Server, at: '/resque'

  get '*path' => redirect('/')  unless Rails.env.development?


end
