Rails.application.routes.draw do
root to: 'root#top'
  get 'user/products/search', to: 'user/products#search',as: 'search_products'
  get 'user/thanks', to:'user/users#finish',as: 'user_thanks'
  get 'user/check', to:'user/users#destroy_check'

  get 'user/products/thanks', to: 'user/histories#finish', as: 'products_buy'
  patch 'admin/:history_item/status', to:'admin/products#change_status', as:'product_status'

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
    patch 'histories/add_address',to:'histories#add_address',as:'add_address'
    post 'histories/cash_deliver',to: 'histories#cash_deliver',as: 'cash_deliver'
    
    resources :histories, :only => [:create,:index,:new]
    resources :cart_items, :only => [:show,:destroy,:update]
    resources :products, :only => [:index,:show] do
      resource :cart_items, :only =>[:create]
      resources :product_reviews, :only =>[:create]
      resource :favorites, :only => [:create,:destroy]
    end
    resources :movies,:only => [:index,:show] do
      resource :movie_reviews,:only => [:create]
    end
  end

  namespace :admin do
    resources :products,:except => [:show]
    resources :lp_images,:only => [:edit,:update]
    resources :movies ,:only => [:index,:create,:edit,:new,:destroy,:update]
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

  # get 'user/products/seach', to: 'user/products#search',as: 'search_products'
  # get 'user/thanks', to:'user/user#finish'
  # get 'user/check', to:'user/users#destroy_check'
  # root to: 'root#top'
end
