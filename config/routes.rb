Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :user do
    resources :users,:only => [:edit,:update,:show]
    resources :histories, :only => [:create,:index,:new]
    resources :cart_items, :only => [:show,:create,:destroy]
    resource :good_reviews, :only =>[:create]
    resources :products, :only => [:index,:show] do
      resource :favorites, :only => [:create,:index,:destroy]
    end
  end

  namespace :admin do
  
  end

  #命名パスは勝手に付けた
  get 'user/products/thanks', to: 'user/histories#finish', as: 'products_buy'
  get 'user/products/seach', to: 'user/products#search',as: 'search_products'
  get 'user/thanks', to:'user/user#finish'
  get 'user/check', to:'user/users#destroy_check'
  root to: 'root#top'
end
