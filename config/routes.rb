HnClone::Application.routes.draw do
  root :to => 'links#index'

  resources :comments do
    resources :comments
  end

  resources :votes

  resources :devise

  devise_for :users

  resources :links do
    resources :comments
  end

end
