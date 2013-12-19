RedditClone::Application.routes.draw do

  resources :users, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]
  resources :subs
  resources :links, :except => :index

  root to: 'subs#index'

end
