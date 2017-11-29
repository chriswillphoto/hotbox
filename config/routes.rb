# == Route Map
#
#          Prefix Verb   URI Pattern                     Controller#Action
#            root GET    /                               pages#home
#           users GET    /users(.:format)                users#index
#                 POST   /users(.:format)                users#create
#        new_user GET    /users/new(.:format)            users#new
#       edit_user GET    /users/:id/edit(.:format)       users#edit
#            user GET    /users/:id(.:format)            users#show
#                 PATCH  /users/:id(.:format)            users#update
#                 PUT    /users/:id(.:format)            users#update
#        toasters GET    /toasters(.:format)             toasters#index
#                 POST   /toasters(.:format)             toasters#create
#     new_toaster GET    /toasters/new(.:format)         toasters#new
#    edit_toaster GET    /toasters/:id/edit(.:format)    toasters#edit
#         toaster GET    /toasters/:id(.:format)         toasters#show
#                 PATCH  /toasters/:id(.:format)         toasters#update
#                 PUT    /toasters/:id(.:format)         toasters#update
#                 DELETE /toasters/:id(.:format)         toasters#destroy
#        comments POST   /comments(.:format)             comments#create
#    edit_comment GET    /comments/:id/edit(.:format)    comments#edit
#         comment PATCH  /comments/:id(.:format)         comments#update
#                 PUT    /comments/:id(.:format)         comments#update
#                 DELETE /comments/:id(.:format)         comments#destroy
#         customs POST   /customs(.:format)              customs#create
#      new_custom GET    /customs/new(.:format)          customs#new
#     edit_custom GET    /customs/:id/edit(.:format)     customs#edit
#          custom GET    /customs/:id(.:format)          customs#show
#                 PATCH  /customs/:id(.:format)          customs#update
#                 PUT    /customs/:id(.:format)          customs#update
#                 DELETE /customs/:id(.:format)          customs#destroy
#     collections GET    /collections(.:format)          collections#index
#                 POST   /collections(.:format)          collections#create
#  new_collection GET    /collections/new(.:format)      collections#new
# edit_collection GET    /collections/:id/edit(.:format) collections#edit
#      collection GET    /collections/:id(.:format)      collections#show
#                 PATCH  /collections/:id(.:format)      collections#update
#                 PUT    /collections/:id(.:format)      collections#update
#                 DELETE /collections/:id(.:format)      collections#destroy
#           login GET    /login(.:format)                session#new
#                 POST   /login(.:format)                session#create
#          logout DELETE /logout(.:format)               session#destroy
#

Rails.application.routes.draw do

  root :to => "pages#home"

  get "/users/:id/favourites" => "favourites#index"
  get "/users/:id/favourites/:board_id" => "favourites#show"

  resources :users, :only => [:index, :new, :create, :show, :edit, :update]
  resources :toasters, :only => [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :comments, :only => [:create, :edit, :update, :destroy]
  resources :customs, :only => [:new, :create, :edit, :update, :destroy, :show]
  resources :collections
  resources :wallposts, :only => [:create]


  get '/login' => "session#new"
  post '/login' => "session#create"
  delete '/logout' => "session#destroy"
end
