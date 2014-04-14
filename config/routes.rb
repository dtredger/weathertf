WeatherTF::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:create, :edit, :update]

  #should password_resets be limited?? i did

  root 'users#index'


  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'get'



  mount Resque::Server, at: '/resque'


  get '*path' => redirect('/')  unless Rails.env.development?

end
