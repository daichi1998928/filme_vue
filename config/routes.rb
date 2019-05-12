Rails.application.routes.draw do


  devise_for :admins,controllers:{
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user do

    resources :histories, :only => [:create,:index,:new]
    resources :cart_items, :only => [:show,:create,:destroy]
    resources :good_reviews, :only =>[:create]
    resources :products, :only => [:index,:show] do
      resources :favorites, :only => [:create,:destroy]
    end
  end


  namespace :admin do
    resources :products,:except => [:show]
    resources :lp_images,:only => [:edit,:update]
    resources :movies do
      resource :movie_reviews,:only => [:create]
    end
    resources :users, :except =>[:show,:create]
  end

  scope module: :admin do
    resources :admins,:except => [:show,:update]
  end


  scope module: :user do
    resources :favorites, :only => [:index]
    resources :users,:only => [:edit,:update,:show]
  end

  #命名パスは勝手に付けた
  get 'user/products/thanks', to: 'user/histories#finish', as: 'products_buy'
  get 'user/products/seach', to: 'user/products#search',as: 'search_products'
  get 'user/thanks', to:'user/user#finish'
  get 'user/check', to:'user/users#destroy_check'
  root to: 'root#top'
end
