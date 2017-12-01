# == Route Map
#
#       Prefix Verb   URI Pattern                                          Controller#Action
#         root GET    /                                                    pages#home
#   favourites GET    /users/:id/favourites(.:format)                      favourites#index
#              GET    /users/:id/favourites/:board_id(.:format)            favourites#show
#              POST   /users/:id/favourites(.:format)                      favourites#create
#              PATCH  /users/:id/favourites/:board_id/:custom_id(.:format) favourites#update
#              PUT    /users/:id/favourites/:board_id/:custom_id(.:format) favourites#update
#              DELETE /users/:id/favourites/:board_id(.:format)            favourites#destroy
#              POST   /customs/:id/upvotes(.:format)                       upvotes#create
#              DELETE /customs/:id/upvotes(.:format)                       upvotes#destroy
#        users GET    /users(.:format)                                     users#index
#              POST   /users(.:format)                                     users#create
#     new_user GET    /users/new(.:format)                                 users#new
#    edit_user GET    /users/:id/edit(.:format)                            users#edit
#         user GET    /users/:id(.:format)                                 users#show
#              PATCH  /users/:id(.:format)                                 users#update
#              PUT    /users/:id(.:format)                                 users#update
#     toasters GET    /toasters(.:format)                                  toasters#index
#              POST   /toasters(.:format)                                  toasters#create
#  new_toaster GET    /toasters/new(.:format)                              toasters#new
# edit_toaster GET    /toasters/:id/edit(.:format)                         toasters#edit
#      toaster GET    /toasters/:id(.:format)                              toasters#show
#              PATCH  /toasters/:id(.:format)                              toasters#update
#              PUT    /toasters/:id(.:format)                              toasters#update
#              DELETE /toasters/:id(.:format)                              toasters#destroy
#     comments POST   /comments(.:format)                                  comments#create
# edit_comment GET    /comments/:id/edit(.:format)                         comments#edit
#      comment PATCH  /comments/:id(.:format)                              comments#update
#              PUT    /comments/:id(.:format)                              comments#update
#              DELETE /comments/:id(.:format)                              comments#destroy
#      customs POST   /customs(.:format)                                   customs#create
#   new_custom GET    /customs/new(.:format)                               customs#new
#  edit_custom GET    /customs/:id/edit(.:format)                          customs#edit
#       custom GET    /customs/:id(.:format)                               customs#show
#              PATCH  /customs/:id(.:format)                               customs#update
#              PUT    /customs/:id(.:format)                               customs#update
#              DELETE /customs/:id(.:format)                               customs#destroy
#    wallposts POST   /wallposts(.:format)                                 wallposts#create
#        login GET    /login(.:format)                                     session#new
#              POST   /login(.:format)                                     session#create
#       logout DELETE /logout(.:format)                                    session#destroy
# 

Rails.application.routes.draw do

  root :to => "pages#home"

  get "/users/:id/favourites" => "favourites#index", :as => "favourites"
  get "/users/:id/favourites/:board_id" => "favourites#show"
  post "/users/:id/favourites/" => "favourites#create"
  patch "/users/:id/favourites/:board_id/:custom_id" => "favourites#update"
  put "/users/:id/favourites/:board_id/:custom_id" => "favourites#update"
  delete "/users/:id/favourites/:board_id" => "favourites#destroy"
  post "/customs/:id/upvotes" => "upvotes#create"
  delete "/customs/:id/upvotes" => "upvotes#destroy"

  resources :users, :only => [:index, :new, :create, :show, :edit, :update]
  resources :toasters, :only => [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :comments, :only => [:create, :edit, :update, :destroy]
  resources :customs, :only => [:new, :create, :edit, :update, :destroy, :show]
  resources :wallposts, :only => [:create]
  # resources :upvotes, :only => [:create]


  get '/login' => "session#new"
  post '/login' => "session#create"
  delete '/logout' => "session#destroy"
end
