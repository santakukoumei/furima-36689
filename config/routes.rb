Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
   resources :items, only: [:new, :create, :edit, :show, :update, :destroy]do
    resources :orders, only: [:index, :create]
  end
end
