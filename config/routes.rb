HnClone::Application.routes.draw do
  root :to => 'links#index'

  resources :comments

  resources :votes

  devise_for :users

  resources :links
end
