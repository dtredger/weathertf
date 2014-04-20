# == Route Map (Updated 2014-04-18 22:17)
#
#              Prefix Verb   URI Pattern                         Controller#Action
#               users GET    /users(.:format)                    users#index
#                     POST   /users(.:format)                    users#create
#            new_user GET    /users/new(.:format)                users#new
#           edit_user GET    /users/:id/edit(.:format)           users#edit
#                user GET    /users/:id(.:format)                users#show
#                     PATCH  /users/:id(.:format)                users#update
#                     PUT    /users/:id(.:format)                users#update
#                     DELETE /users/:id(.:format)                users#destroy
#            sessions POST   /sessions(.:format)                 sessions#create
#         new_session GET    /sessions/new(.:format)             sessions#new
#             session DELETE /sessions/:id(.:format)             sessions#destroy
#     password_resets POST   /password_resets(.:format)          password_resets#create
# edit_password_reset GET    /password_resets/:id/edit(.:format) password_resets#edit
#      password_reset PATCH  /password_resets/:id(.:format)      password_resets#update
#                     PUT    /password_resets/:id(.:format)      password_resets#update
#                root GET    /                                   users#index
#              signup GET    /signup(.:format)                   users#new
#              signin GET    /signin(.:format)                   sessions#new
#             signout DELETE /signout(.:format)                  sessions#destroy
#       resque_server        /resque                             Resque::Server
#
require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'

WeatherTF::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:create, :edit, :update]

  #should password_resets be limited?? i did

  root 'users#index'


  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'


  mount Resque::Server, at: '/resque'


  get '*path' => redirect('/')  unless Rails.env.development?

end
