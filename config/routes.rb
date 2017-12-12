Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end

  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :orders, only: [:create, :show]

  resource :users, only: [:create, :new, :show, :edit, :update]

  resource :session, only: [:create, :new, :destroy]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :show, :new, :create]
  end

end
 
